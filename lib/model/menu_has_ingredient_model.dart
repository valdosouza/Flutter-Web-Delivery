class MenuHasIngredientModel {
  int tbProductId;
  String description;

  MenuHasIngredientModel({
    this.tbProductId,
    this.description,
  });

  factory MenuHasIngredientModel.fromJson(dynamic json) {
    return MenuHasIngredientModel(
      tbProductId: json["tb_product_id"],
      description: json["description"],
    );
  }
}
