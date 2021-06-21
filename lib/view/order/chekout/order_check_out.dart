import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/app_routes.dart';
import 'package:delivery/component/components.dart';
import 'package:delivery/controller/order_controller.dart';
import 'package:delivery/view/order/chekout/order_delivery.dart';
import 'package:delivery/view/order/chekout/order_subtotal_items.dart';
import 'package:delivery/view/order/chekout/order_total.dart';
import 'package:delivery/view/order/payment/order_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

// ignore: must_be_immutable
class OrderCheckOut extends StatelessWidget {
  var _changeValue = TextEditingController();
  final orderController = GetIt.I.get<OrderController>();
  final _form = GlobalKey<FormState>();

  Future<void> _saveForm() async {
    _form.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    final order = GetIt.I.get<OrderController>();

    final _mediaQueryData = MediaQuery.of(context);
    order.order.totalizer();
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Totalizadores",
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
      body: Form(
        key: _form,
        child: Container(
          height: _mediaQueryData.size.height,
          child: ListView(
            children: [
              orderSubtotalItems(context),
              orderDelivery(context),
              orderTotal(context),
              orderPayment(context),
              Observer(builder: (_) {
                return Visibility(
                  visible:
                      (orderController.order.paymentType.contains('DINHEIRO')),
                  child: Card(
                    elevation: 10,
                    margin: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Text(
                                "Precisa de Troco para quanto?",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                            child: Container(
                              height: 60,
                              child: TextFormField(
                                  controller: _changeValue,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'informe o valor',
                                    fillColor: Colors.green,
                                  ),
                                  onSaved: (value) {
                                    if (orderController.order.paymentType
                                        .contains('DINHEIRO'))
                                      orderController.order.changeValue =
                                          double.parse(value);
                                    else
                                      orderController.order.changeValue = 0.0;
                                  }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.lightGreen),
                    ),
                  ),
                  onPressed: () => {
                    orderController.validateForm().then((_) {
                      if (!orderController.validate) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Validação do Pedido"),
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
                          print("Falhou");
                        });
                      } else {
                        _saveForm();
                        Navigator.pushNamed(context, AppRoutes.ORDERCONCLUDE);
                      }
                    })
                  },
                  child: Container(
                    height: 50,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text('Avançar',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        new Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                          size: 40.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              orderKeepBuying(context),
            ],
          ),
        ),
      ),
    );
  }
}
