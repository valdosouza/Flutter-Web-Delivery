import 'dart:convert';

import 'package:delivery/controller/cal_main_controller.dart';
import 'package:delivery/controller/institution_controller.dart';
import 'package:delivery/model/menu_model.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

import '../constants.dart';
part 'cal_flavor_controller.g.dart';

class CalFlavorController = _CalFlavorController with _$CalFlavorController;

abstract class _CalFlavorController with Store {
  final String _baseUrl = '${Constants.BASE_API_URL}/restCalzone/getlist/';

  List<MenuModel> menuModel = [];
  final institutionController = GetIt.I.get<InstitutionController>();
  final calMainController = GetIt.I.get<CalMainController>();

  Future getPosts(String url) async {
    final response = await http.post(
      _baseUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'tb_institution_id': "${institutionController.institution.id}",
        'tb_measure_id': "${calMainController.item.measureId}"
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      menuModel = (data as List).map((json) {
        return MenuModel(
          id: json['id'],
          description: json["description"],
          priceTag: double.parse(json['price_tag']),
          measure: json["measure"],
          linkUrl: (json['link_url'] != null)
              ? json['link_url']
              : "https://www.gestaowebsetes.com.br/images/icon_calzone.jpg",
        );
      }).toList();
    } else {
      print("Error in URL");
    }
  }

  @observable
  ObservableFuture<List<MenuModel>> postsListFuture;
  @observable
  List<MenuModel> listFiltered;

  @action
  filter(String search) {
    if (search != '') {
      listFiltered = menuModel
          .where((f) =>
              (f.description.toUpperCase().contains(search.toUpperCase())))
          .toList();
    } else {
      listFiltered = menuModel;
    }
  }

  @action
  Future fetchPosts() => postsListFuture =
      ObservableFuture(getPosts(_baseUrl).then((posts) => posts));

  void getThePosts() {
    fetchPosts();
  }
}
