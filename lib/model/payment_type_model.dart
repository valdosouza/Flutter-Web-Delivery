class PaymentTypeModel {
  int id;
  String description;

  PaymentTypeModel({
    this.id,
    this.description = "Informar...",
  });

  factory PaymentTypeModel.fromJson(dynamic json) {
    return PaymentTypeModel(
      id: json["id"],
      description: json["description"],
    );
  }
}
