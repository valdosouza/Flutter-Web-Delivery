import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/app_routes.dart';
import 'package:delivery/component/components.dart';
import 'package:delivery/controller/order_controller.dart';
import 'package:delivery/controller/piz_main_controller.dart';
import 'package:delivery/model/order_items_model.dart';

import 'package:delivery/view/pizza/flavor/piz_flavor.dart';
import 'package:delivery/view/pizza/main/piz_qtty_flavor.dart';
import 'package:delivery/view/pizza/edge/piz_edge.dart';
import 'package:delivery/view/pizza/dough/piz_dough.dart';
import 'package:delivery/view/pizza/meaure/piz_measure.dart';
import 'package:delivery/view/pizza/note/piz_note.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class PizMain extends StatefulWidget {
  @override
  _PizMainState createState() => _PizMainState();
}

class _PizMainState extends State<PizMain> {
  @override
  Widget build(BuildContext context) {
    final pizMainController = GetIt.I.get<PizMainController>();

    final OrderItemsModel item = ModalRoute.of(context).settings.arguments;
    final _mediaQueryData = MediaQuery.of(context);
    if (item.subTotal > 0) {
      pizMainController.edititem(item);
    }
    pizMainController.sumTotal();
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Minha Pizza",
          minFontSize: 8,
          maxFontSize: 20,
          maxLines: 1,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          shoppingCart(context),
        ],
      ),
      body: Container(
        height: _mediaQueryData.size.height - 145,
        child: SingleChildScrollView(
          child: Column(
            children: [
              PizMeasure(),
              PizQttyFlavor(),
              PizFlavor(index: 0),
              PizFlavor(index: 1),
              PizFlavor(index: 2),
              PizFlavor(index: 3),
              PizEdge(index: 4),
              PizDough(index: 5),
              PizNote(),
            ],
          ),
        ),
      ),
      bottomSheet: pizzaBottom(context),
    );
  }

  Widget pizzaBottom(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        height: 60,
        child: Column(children: [
          pizzaFinishItem(context),
        ]),
      ),
    );
  }

  Widget pizzaTotalizer(BuildContext context) {
    final pizMainController = GetIt.I.get<PizMainController>();
    return Card(
      elevation: 15,
      margin: EdgeInsets.fromLTRB(150, 8, 8, 8),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.centerRight,
        child: Observer(
          builder: (_) {
            return AutoSizeText(
              "Preço : R\$ " +
                  pizMainController.item.subTotal.toStringAsFixed(2),
              minFontSize: 8,
              maxFontSize: 20,
              maxLines: 1,
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

  Widget pizzaFinishItem(BuildContext context) {
    final pizMainController = GetIt.I.get<PizMainController>();
    final orderController = GetIt.I.get<OrderController>();
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.lightGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          onPressed: (pizMainController.item.subTotal > 0.0)
              ? () => {
                    pizMainController.validateForm().then((_) {
                      if (!pizMainController.validate) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Validação do Pedido"),
                              content: Text(pizMainController.msgvalidate),
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
                          print("Falhou");
                        });
                      } else {
                        orderController.savePizza(pizMainController.item);
                        print(orderController.order.items);
                        orderController.qtdeShoppingCart();
                        pizMainController.sumTotal();
                        Navigator.pushNamed(context, AppRoutes.ORDERSUBTOTAL);
                      }
                    })
                  }
              : null,
          child: Container(
            height: 50,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new AutoSizeText(
                  (pizMainController.item.subTotal > 0.0)
                      ? 'Adicionar R\$ ' +
                          pizMainController.item.subTotal.toStringAsFixed(2)
                      : 'Adicionar ',
                  minFontSize: 10,
                  maxFontSize: 17,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
