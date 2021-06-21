class GroupHasOptionalModel {
  int tbProductId;
  String description;
  double priceTag;

  GroupHasOptionalModel({
    this.tbProductId,
    this.description,
    this.priceTag,
  });

  factory GroupHasOptionalModel.fromJson(dynamic json) {
    return GroupHasOptionalModel(
      tbProductId: json["tb_product_id"],
      description: json["description"],
      priceTag: double.parse(json['price_tag']),
    );
  }
}
