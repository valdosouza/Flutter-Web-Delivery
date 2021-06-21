import 'dart:async';
import 'dart:convert';
import 'package:delivery/controller/institution_controller.dart';
import 'package:delivery/model/rest_subgroup_model.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import '../constants.dart';
part 'bev_rest_subgroup_controller.g.dart';

class BevRestSubgroupController = _BevRestSubgroupController
    with _$BevRestSubgroupController;

abstract class _BevRestSubgroupController with Store {
  final String _baseUrl = '${Constants.BASE_API_URL}/RestSubgroup/getList';

  @observable
  List<RestSubgroupModel> items = [];
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
          'group_desc': "BEBIDA",
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      items = (data as List).map((json) {
        return RestSubgroupModel.fromJson(json);
      }).toList();

      return items;
    } else {
      print("Error in URL");
    }
  }

  @observable
  ObservableFuture<List<RestSubgroupModel>> postsListFuture;

  @action
  Future fetchPosts() => postsListFuture =
      ObservableFuture(getPosts(_baseUrl).then((posts) => posts));

  void getThePosts() {
    fetchPosts();
  }
}
