class GroupHasAttributeModel {
  int id;
  String description;
  String kind;
  double priceTag;

  GroupHasAttributeModel({
    this.id,
    this.description,
    this.kind,
    this.priceTag,
  });

  factory GroupHasAttributeModel.fromJson(dynamic json) {
    return GroupHasAttributeModel(
      id: json["id"],
      description: json["description"],
      kind: json["kind"],
      priceTag: double.parse(json['price_tag']),
    );
  }
}
