import 'package:delivery/model/customer.dart';
import 'package:delivery/model/order_items_model.dart';

import 'package:mobx/mobx.dart';
part 'order_model.g.dart';

class OrderModel = _OrderModel with _$OrderModel;

abstract class _OrderModel with Store {
  int institutionID;
  DateTime dtRecord;
  @observable
  double subtotalValue = 0.0;
  @observable
  int kindAttendance = 0;
  @observable
  double deliveryValue = 0.0;
  @observable
  double totalValue = 0.0;
  @observable
  String paymentType = "Informar...";
  @observable
  double changeValue = 0.0;
  Customer customer;
  List<OrderItemsModel> items = [];

  _OrderModel({
    this.dtRecord,
  });

  @action
  setInstitutionID(int value) => institutionID = value;

  @action
  setCustomer(Customer value) => customer = value;

  totalizer() {
    subtotalValue = 0.0;
    for (OrderItemsModel e in items) {
      subtotalValue = subtotalValue + (e.subTotal * e.qtde);
    }
    totalValue = subtotalValue + deliveryValue;
  }

  clear() {
    this.subtotalValue = 0.0;
    this.deliveryValue = 0.0;
    this.totalValue = 0.0;
    this.paymentType = "Informar...";
    items.clear();
  }

  Map<String, dynamic> toJson() => {
        'orderID': '0',
        'updatedAt': '',
        'institutionID': institutionID.toString(),
        'dt_record': dtRecord.toString(),
        'customer': customer.toJson(),
        'subtotalValue': subtotalValue.toString(),
        'kindAttendance': kindAttendance.toString(),
        'deliveryValue': deliveryValue.toString(),
        'changeValue': changeValue.toString(),
        'totalValue': totalValue.toString(),
        'paymentType': paymentType,
        'items': items.map((i) => i.toJson()).toList(), //.toString(),
      };
}
