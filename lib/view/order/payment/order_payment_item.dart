import 'package:delivery/controller/order_controller.dart';
import 'package:delivery/controller/order_payment_controller.dart';
import 'package:delivery/model/payment_type_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class OrderPaymentItem extends StatelessWidget {
  final PaymentTypeModel item;

  const OrderPaymentItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderPaymentController = GetIt.I.get<OrderPaymentController>();
    final orderController = GetIt.I.get<OrderController>();
    if (orderPaymentController.paymentTypeId > 0)
      orderPaymentController.paymentTypeId = 0;
    return Observer(
      builder: (_) {
        return Column(
          children: [
            RadioListTile(
              value: item.id,
              groupValue: orderPaymentController.paymentTypeId,
              title: Text(item.description),
              selected: (orderPaymentController.paymentTypeId == item.id),
              activeColor: Colors.red,
              onChanged: (int value) {
                orderPaymentController.paymentTypeId = value;
                orderController.order.paymentType = item.description;
              },
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ],
        );
      },
    );
  }
}
