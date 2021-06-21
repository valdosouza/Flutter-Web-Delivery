import 'package:mobx/mobx.dart';
part 'order_items_detail_add_model.g.dart';

class OrderItemsDetailAddModel = _OrderItemsDetailAddModel
    with _$OrderItemsDetailAddModel;

abstract class _OrderItemsDetailAddModel with Store {
  int tbProductId;
  String description;
  double priceTag;
  @observable
  bool check;
  _OrderItemsDetailAddModel({
    this.tbProductId = 0,
    this.description = "Não informado",
    this.priceTag = 0.0,
    this.check = false,
  });

  @action
  setCheck(bool value) {
    check = value;
  }

  Map<String, dynamic> toJson() => {
        'tb_product_id': tbProductId.toString(),
        'description': description,
        'price_tag': priceTag.toString(),
        'check': check.toString(),
      };
}
