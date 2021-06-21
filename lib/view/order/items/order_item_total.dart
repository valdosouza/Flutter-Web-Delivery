import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/app_routes.dart';
import 'package:delivery/component/components.dart';
import 'package:delivery/component/drawer_component.dart';
import 'package:delivery/controller/order_controller.dart';

import 'package:delivery/view/order/items/order_item_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class OrderItemTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Itens do Pedido",
          minFontSize: 8,
          maxFontSize: 20,
          maxLines: 1,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      drawer: DrawerComponent(),
      body: OrderItemList(),
      bottomSheet: orderBottom(context),
    );
  }

  Widget orderBottom(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        height: 170,
        child: ListView(children: [
          orderTotalizer(context),
          orderFinishOrder(context),
          orderKeepBuying(context),
        ]),
      ),
    );
  }

  Widget orderFinishOrder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.lightGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.lightGreen),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.ORDERKINDATTENDANCE);
        },
        child: Container(
          height: 50,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('Avançar',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              new Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
                size: 40.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget orderTotalizer(BuildContext context) {
    final orderController = GetIt.I.get<OrderController>();
    orderController.order.totalizer();
    return Card(
      elevation: 15,
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.centerRight,
        child: Observer(
          builder: (_) {
            return AutoSizeText(
              "Valor total dos Itens : R\$ ${orderController.order.subtotalValue.toStringAsFixed(2)}",
              minFontSize: 8,
              maxFontSize: 20,
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0Xff2f4538),
              ),
            );
          },
        ),
      ),
    );
  }
}
