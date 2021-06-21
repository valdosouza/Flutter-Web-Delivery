import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/app_routes.dart';
import 'package:delivery/component/components.dart';
import 'package:delivery/controller/cal_main_controller.dart';
import 'package:delivery/controller/order_controller.dart';
import 'package:delivery/model/order_items_model.dart';
import 'package:delivery/view/calzone/dough/cal_dough.dart';
import 'package:delivery/view/calzone/flavor/cal_flavor.dart';
import 'package:delivery/view/calzone/main/cal_qtty_flavor.dart';
import 'package:delivery/view/calzone/meaure/cal_measure.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CalMain extends StatefulWidget {
  @override
  _CalMainState createState() => _CalMainState();
}

class _CalMainState extends State<CalMain> {
  @override
  Widget build(BuildContext context) {
    final calMainController = GetIt.I.get<CalMainController>();
    final OrderItemsModel item = ModalRoute.of(context).settings.arguments;
    final _mediaQueryData = MediaQuery.of(context);
    if (item.subTotal > 0) calMainController.edititem(item);
    calMainController.sumTotal();
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Meu Calzone",
          minFontSize: 8,
          maxFontSize: 20,
          maxLines: 1,
          textAlign: TextAlign.center,
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
        height: _mediaQueryData.size.height - 160,
        child: ListView(
          children: <Widget>[
            CalMeasure(),
            CalQttyFlavor(),
            CalFlavor(index: 0),
            CalFlavor(index: 1),
            CalFlavor(index: 2),
            CalFlavor(index: 3),
            CalDough(index: 5),
          ],
        ),
      ),
      bottomSheet: calzoneBottom(context),
    );
  }

  Widget calzoneBottom(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        height: 60,
        child: Column(children: [
          calzoneFinishItem(context),
        ]),
      ),
    );
  }

  Widget calzoneTotalizer(BuildContext context) {
    final calMainController = GetIt.I.get<CalMainController>();
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
                  calMainController.item.subTotal.toStringAsFixed(2),
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

  Widget calzoneFinishItem(BuildContext context) {
    final calMainController = GetIt.I.get<CalMainController>();
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
          onPressed: (calMainController.item.subTotal > 0.0)
              ? () => {
                    calMainController.validateForm().then((_) {
                      if (!calMainController.validate) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Validação do Pedido"),
                              content: Text(calMainController.msgvalidate),
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
                        orderController.saveCalzone(calMainController.item);
                        orderController.qtdeShoppingCart();
                        calMainController.sumTotal();
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
                  (calMainController.item.subTotal > 0.0)
                      ? 'Adicionar R\$ ' +
                          calMainController.item.subTotal.toStringAsFixed(2)
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
