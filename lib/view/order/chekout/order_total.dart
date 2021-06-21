import 'package:delivery/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

Widget orderTotal(BuildContext context) {
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
            child: Image.asset('images/icon_checked_1.jpg'),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text(
                "Valor Total",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            "R\$ ${orderController.order.totalValue.toStringAsFixed(2)}",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
