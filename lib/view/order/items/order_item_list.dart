import 'package:delivery/controller/order_controller.dart';
import 'package:delivery/view/order/items/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:get_it/get_it.dart';

// ignore: must_be_immutable
class OrderItemList extends StatelessWidget {
  Widget widtget;

  @override
  Widget build(BuildContext context) {
    final _mediaQueryData = MediaQuery.of(context);
    final orderController = GetIt.I.get<OrderController>();
    Future.delayed(Duration.zero, () async {
      orderController.getlistObservable();
    });

    return Container(
      height: _mediaQueryData.size.height - 250,
      child: Observer(builder: (_) {
        return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: orderController.observableItems.length,
            itemBuilder: (context, index) {
              final post = orderController.observableItems[index];
              return OrderItem(item: post);
            });
      }),
    );
  }
}
