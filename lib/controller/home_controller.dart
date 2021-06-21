import 'dart:async';
import 'dart:convert';
import 'package:delivery/controller/institution_controller.dart';
import 'package:delivery/model/rest_group_model.dart';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import '../constants.dart';
part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final String _baseUrl = '${Constants.BASE_API_URL}/RestGroup/getList';

  @observable
  List<RestGroupModel> items = [];

  Future getPosts(String url) async {
    final institutionController = GetIt.I.get<InstitutionController>();
    final response = await http.post(
      _baseUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'tb_institution_id': '${institutionController.institution.id}'
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      items = (data as List).map((json) {
        return RestGroupModel.fromJson(json);
      }).toList();

      return items;
    } else {
      print("Error in URL");
    }
  }

  @observable
  ObservableFuture<List<RestGroupModel>> postsListFuture;

  @action
  Future fetchPosts() => postsListFuture =
      ObservableFuture(getPosts(_baseUrl).then((posts) => posts));

  void getThePosts() {
    fetchPosts();
  }
}
