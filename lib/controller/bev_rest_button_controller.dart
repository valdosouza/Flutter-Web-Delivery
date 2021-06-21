import 'dart:async';
import 'dart:convert';
import 'package:delivery/controller/bev_main_controller.dart';
import 'package:delivery/controller/institution_controller.dart';
import 'package:delivery/model/rest_button_model.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import '../constants.dart';
part 'bev_rest_button_controller.g.dart';

class BevRestButtonController = _BevRestButtonController
    with _$BevRestButtonController;

abstract class _BevRestButtonController with Store {
  final String _baseUrl = '${Constants.BASE_API_URL}/RestButton/getListImage';

  List<RestButtonModel> items = [];
  final institutionController = GetIt.I.get<InstitutionController>();
  final bevMainController = GetIt.I.get<BevMainController>();
  Future getPosts(String url) async {
    final response = await http.post(
      _baseUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'tb_institution_id': "${institutionController.institution.id}",
          'subgroup_desc': "${bevMainController.chosenSubGroup}",
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      items = (data as List).map((json) {
        return RestButtonModel.fromJson(json);
      }).toList();

      return items;
    } else {
      print("Error in URL");
    }
  }

  @observable
  ObservableFuture<List<RestButtonModel>> postsListFuture;

  @action
  Future fetchPosts() => postsListFuture =
      ObservableFuture(getPosts(_baseUrl).then((posts) => posts));

  void getThePosts() {
    fetchPosts();
  }
}
