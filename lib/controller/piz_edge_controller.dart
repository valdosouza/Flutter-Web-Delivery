import 'dart:async';
import 'dart:convert';
import 'package:delivery/controller/institution_controller.dart';
import 'package:delivery/controller/piz_main_controller.dart';
import 'package:delivery/model/group_has_attribute_model.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

import '../constants.dart';

part 'piz_edge_controller.g.dart';

class PizEdgeController = _PizEdgeController with _$PizEdgeController;

abstract class _PizEdgeController with Store {
  final String _baseUrl = '${Constants.BASE_API_URL}/restEdge/getlist/';

  @observable
  List<GroupHasAttributeModel> items = [];
  final institutionController = GetIt.I.get<InstitutionController>();
  final pizMainController = GetIt.I.get<PizMainController>();
  Future getPosts(String url) async {
    final response = await http.post(
      _baseUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'tb_institution_id': "${institutionController.institution.id}",
          'tb_measure_id': "${pizMainController.item.measureId}"
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      items = (data as List).map((json) {
        return GroupHasAttributeModel.fromJson(json);
      }).toList();
      return items;
    } else {
      print("Error in URL");
    }
  }

  @observable
  ObservableFuture<List<GroupHasAttributeModel>> postsListFuture;

  @action
  Future fetchPosts() => postsListFuture =
      ObservableFuture(getPosts(_baseUrl).then((posts) => posts));

  void getThePosts() {
    fetchPosts();
  }

  @observable
  int edgeId = 0;
}
