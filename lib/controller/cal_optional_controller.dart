import 'dart:async';
import 'dart:convert';

import 'package:delivery/controller/institution_controller.dart';
import 'package:delivery/model/group_has_optional_model.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

import '../constants.dart';
part 'cal_optional_controller.g.dart';

class CalOptionalController = _CalOptionalController
    with _$CalOptionalController;

abstract class _CalOptionalController with Store {
  final String _baseUrl =
      '${Constants.BASE_API_URL}/restGroupHasOptional/getlist/';

  @observable
  List<GroupHasOptionalModel> items = [];
  final institutionController = GetIt.I.get<InstitutionController>();
  Future getPosts(String url) async {
    final response = await http.post(
      _baseUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'tb_institution_id': "${institutionController.institution.id}",
          'group_desc': "CALZONE"
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      items = (data as List).map((json) {
        return GroupHasOptionalModel.fromJson(json);
      }).toList();

      return items;
    } else {
      print("Error in URL");
    }
  }

  @observable
  ObservableFuture<List<GroupHasOptionalModel>> postsListFuture;

  @action
  Future fetchPosts() => postsListFuture =
      ObservableFuture(getPosts(_baseUrl).then((posts) => posts));

  void getThePosts() {
    fetchPosts();
  }
}
