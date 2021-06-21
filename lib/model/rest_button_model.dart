import 'package:mobx/mobx.dart';

class RestButtonModel with Store {
  int menuId;
  int institutionId;
  String description;
  String linkUrl;

  RestButtonModel({
    this.menuId,
    this.institutionId,
    this.description,
    this.linkUrl,
  });
  factory RestButtonModel.fromJson(dynamic json) {
    return RestButtonModel(
      menuId: json["id"],
      institutionId: json["tb_institution_id"],
      description: json["description"],
      linkUrl: json["link_url"],
    );
  }
}
