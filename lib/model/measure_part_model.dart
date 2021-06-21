class MeasurePartsModel {
  int id;
  String description;
  int parts;
  int slices;

  MeasurePartsModel({
    this.id,
    this.description,
    this.parts,
    this.slices,
  });

  factory MeasurePartsModel.fromJson(dynamic json) {
    return MeasurePartsModel(
      id: json["id"],
      description: json["description"],
      parts: json["parts"],
      slices: json["slices"],
    );
  }
}
