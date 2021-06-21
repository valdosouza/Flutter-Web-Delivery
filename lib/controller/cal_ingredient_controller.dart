import 'dart:async';
import 'dart:convert';

import 'package:delivery/controller/cal_main_controller.dart';
import 'package:delivery/controller/institution_controller.dart';
import 'package:delivery/model/menu_has_ingredient_model.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import '../constants.dart';
part 'cal_ingredient_controller.g.dart';

class CalIngredientController = _CalIngredientController
    with _$CalIngredientController;

abstract class _CalIngredientController with Store {
  final String _baseUrl =
      '${Constants.BASE_API_URL}/restMenuHasIngredient/getlist/';

  @observable
  List<MenuHasIngredientModel> items = [];
  final institutionController = GetIt.I.get<InstitutionController>();
  final calMainController = GetIt.I.get<CalMainController>();

  Future getPosts(String url) async {
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'tb_institution_id': "${institutionController.institution.id}",
          'tb_rest_menu_id': "${calMainController.menuid}"
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      items = (data as List).map((json) {
        return MenuHasIngredientModel.fromJson(json);
      }).toList();

      return items;
    } else {
      print("Error in URL");
    }
  }

  @observable
  ObservableFuture<List<MenuHasIngredientModel>> postsListFuture;

  @action
  Future fetchPosts() => postsListFuture =
      ObservableFuture(getPosts(_baseUrl).then((posts) => posts));

  void getThePosts() {
    fetchPosts();
  }
}
