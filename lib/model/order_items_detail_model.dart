import 'package:delivery/model/order_items_detail_rmv_model.dart';
import 'package:mobx/mobx.dart';

import 'order_items_detail_add_model.dart';
part 'order_items_detail_model.g.dart';

class OrderItemsDetailModel = _OrderItemsDetailModel
    with _$OrderItemsDetailModel;

abstract class _OrderItemsDetailModel with Store {
  @observable
  int id;
  @observable
  int menuId;
  @observable
  String description;
  @observable
  double priceTag;
  @observable
  String kind;
  @observable
  String note;
  @observable
  bool check;
  ObservableList<OrderItemsDetailRmvModel> ingredRemove;
  ObservableList<OrderItemsDetailAddModel> ingredOptional;

  _OrderItemsDetailModel({
    this.id = 0,
    this.menuId = 0,
    this.description = 'Item',
    this.priceTag = 0.0,
    this.kind = '',
    this.note,
    this.check = false,
    this.ingredRemove,
    this.ingredOptional,
  });

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'menuId': menuId.toString(),
        'description': description,
        'priceTag': priceTag.toString(),
        'kind': kind,
        'note': note,
        'check': check.toString(),

        'ingredRemove': ingredRemove == null
            ? null
            : ingredRemove.map((i) => i.toJson()).toList(), //.toString(),
        'ingredOptional': ingredOptional == null
            ? null
            : ingredOptional.map((i) => i.toJson()).toList(), // .toString(),
      };
}
