import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/app_routes.dart';
import 'package:delivery/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

Widget divisor() {
  return Divider(
    color: Colors.white,
    thickness: 1,
  );
}

Widget appFinishBottom(BuildContext context) {
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
      onPressed: () => goToShoppingCart(context),
      child: Container(
        height: 50,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            shoppingCart(context),
            new Text('Finalizar Pedido',
                style: TextStyle(color: Colors.black, fontSize: 20)),
          ],
        ),
      ),
    ),
  );
}

Widget orderKeepBuying(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(40, 5, 40, 10),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0Xff002434),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(
            color: Color(0Xff002434),
          ),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.HOME);
      },
      child: Container(
        height: 50,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 20.0,
            ),
            new Text(' Continuar Comprando',
                style: TextStyle(color: Colors.white, fontSize: 13)),
          ],
        ),
      ),
    ),
  );
}

goToShoppingCart(BuildContext context) {
  final orderController = GetIt.I.get<OrderController>();
  orderController.verifyItems().then((_) {
    if (!orderController.validate) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Validação do Pedido",
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            content: Text(orderController.msgvalidate),
            actions: <Widget>[
              ElevatedButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      ).whenComplete(() {
        print(orderController.msgvalidate);
      });
    } else {
      Navigator.pushNamed(context, AppRoutes.ORDERSUBTOTAL);
    }
  });
}

Widget shoppingCart(BuildContext context) {
  final orderController = GetIt.I.get<OrderController>();
  return InkWell(
    onTap: () => goToShoppingCart(context),
    child: Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                width: 22,
                height: 22,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                ),
                child: Observer(builder: (_) {
                  return AutoSizeText(
                    orderController.quantity.toStringAsFixed(0),
                    minFontSize: 8,
                    maxFontSize: 18,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
