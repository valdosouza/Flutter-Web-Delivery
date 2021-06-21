import 'package:delivery/app_routes.dart';
import 'package:delivery/controller/order_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

Widget orderPayment(BuildContext context) {
  final orderController = GetIt.I.get<OrderController>();
  return Card(
    elevation: 10,
    margin: EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 8,
    ),
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(9.0),
            child: Observer(builder: (_) {
              return getImage(orderController.order.paymentType);
            }),
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Observer(builder: (_) {
                return Text(
                  "Pagamento : ${orderController.order.paymentType}",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                );
              }),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.ORDERPAYMENTMAIN),
            ),
          ),
        ),
      ],
    ),
  );
}

Image getImage(String pagamento) {
  if (pagamento == "Informar...") {
    return Image.asset('images/icon_question.jpg');
  } else {
    return Image.asset('images/icon_checked_1.jpg');
  }
}
