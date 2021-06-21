import 'package:delivery/model/order_items_model.dart';

import 'package:mobx/mobx.dart';
part 'bev_main_controller.g.dart';

class BevMainController = _BevMainController with _$BevMainController;

abstract class _BevMainController with Store {
  OrderItemsModel item;

  @observable
  String measure = "Medida";

  update() {}

  edititem(OrderItemsModel itemedit) {
    item = itemedit;
    item.itemsDetail = item.itemsDetail;
    measure = item.measure;
  }

  additem() {
    item = OrderItemsModel(
      description: "Bebida",
      measure: measure,
      qtde: 1,
    );
    measure = "Medida";
  }

  String chosenSubGroup = '';
  int chosenMenuId = 0;
  String chosenMenuDesc = '';

  @observable
  bool validate = true;

  @observable
  String msgvalidate = '';

  @action
  Future validateForm() async {
    validate = true;
  }
}
