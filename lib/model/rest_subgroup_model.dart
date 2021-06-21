import 'package:mobx/mobx.dart';

class RestSubgroupModel with Store {
  int id;
  int institutionId;
  int restGroupId;
  String description;
  String linkUrl;

  RestSubgroupModel({
    this.id,
    this.institutionId,
    this.restGroupId,
    this.description,
    this.linkUrl,
  });
  factory RestSubgroupModel.fromJson(dynamic json) {
    return RestSubgroupModel(
      id: json["id"],
      institutionId: json["tb_institution_id"],
      restGroupId: json["tb_rest_group_id"],
      description: json["description"],
      linkUrl: json["link_url"],
    );
  }
}
