import 'dart:async';
import 'dart:convert';

import 'package:delivery/controller/institution_controller.dart';
import 'package:delivery/controller/piz_main_controller.dart';
import 'package:delivery/model/menu_has_ingredient_model.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import '../constants.dart';
part 'piz_ingredient_controller.g.dart';

class PizIngredientController = _PizIngredientController
    with _$PizIngredientController;

abstract class _PizIngredientController with Store {
  final String _baseUrl =
      '${Constants.BASE_API_URL}/restMenuHasIngredient/getlist/';

  @observable
  List<MenuHasIngredientModel> items = [];
  final institutionController = GetIt.I.get<InstitutionController>();
  final pizMainController = GetIt.I.get<PizMainController>();

  Future getPosts(String url, int index) async {
    items.clear();

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'tb_institution_id': "${institutionController.institution.id}",
          'tb_rest_menu_id':
              "${pizMainController.item.itemsDetail[index].menuId}"
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
  Future fetchPosts(int index) => postsListFuture =
      ObservableFuture(getPosts(_baseUrl, index).then((posts) => posts));

  void getThePosts(int index) {
    fetchPosts(index);
  }
}
