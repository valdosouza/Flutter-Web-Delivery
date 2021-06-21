import 'package:mobx/mobx.dart';

class RestGroupModel with Store {
  int id;
  int institutionId;
  String description;
  String linkUrl;

  RestGroupModel({
    this.id,
    this.institutionId,
    this.description,
    this.linkUrl = "",
  });
  factory RestGroupModel.fromJson(dynamic json) {
    return RestGroupModel(
      id: json["id"],
      institutionId: json["tb_institution_id"],
      description: json["description"],
      linkUrl: json["link_url"],
    );
  }
}
