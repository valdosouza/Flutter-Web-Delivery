import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/app_routes.dart';
import 'package:delivery/controller/order_controller.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// ignore: must_be_immutable
class OrderKindAttendance extends StatelessWidget {
  final orderController = GetIt.I.get<OrderController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Tipo de Atendimento",
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
      body: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            orderMessage(context),
            orderDelivery(context),
            orderTakeAway(context),
          ],
        ),
      ),
    );
  }

  Widget orderMessage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      alignment: Alignment.center,
      child: AutoSizeText(
        "Como deseja receber seu pedido?",
        minFontSize: 8,
        maxFontSize: 20,
        maxLines: 1,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
    );
  }

  Widget orderDelivery(BuildContext context) {
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
          orderController.order.kindAttendance = 0;
          Navigator.pushNamed(context, AppRoutes.ORDERSHIPPING);
        },
        child: Container(
          height: 50,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.delivery_dining,
                color: Colors.white,
                size: 40.0,
              ),
              new Divider(
                endIndent: 10,
              ),
              new Text('Por favor, entregue.',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }

  Widget orderTakeAway(BuildContext context) {
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
          orderController.order.kindAttendance = 1;
          orderController.order.deliveryValue = 0.00;
          Navigator.pushNamed(context, AppRoutes.ORDERCHECKOUT);
        },
        child: Container(
          height: 50,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.directions_walk,
                color: Colors.white,
                size: 40.0,
              ),
              new Divider(
                endIndent: 10,
              ),
              new Text('Vou retirar no balcão.',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
