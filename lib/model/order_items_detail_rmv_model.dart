import 'package:mobx/mobx.dart';
part 'order_items_detail_rmv_model.g.dart';

//@JsonSerializable()
class OrderItemsDetailRmvModel = _OrderItemsDetailRmvModel
    with _$OrderItemsDetailRmvModel;

abstract class _OrderItemsDetailRmvModel with Store {
  int tbProductId;
  String description;
  @observable
  bool check;
  _OrderItemsDetailRmvModel({
    this.tbProductId = 0,
    this.description = "Não informado",
    this.check = true,
  });

  @action
  setCheck(bool value) {
    check = value;
  }

  Map<String, dynamic> toJson() => {
        'id': tbProductId.toString(),
        'description': description,
        'check': check.toString(),
      };
}
