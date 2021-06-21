import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/app_routes.dart';
import 'package:delivery/controller/order_controller.dart';
import 'package:delivery/model/order_items_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:expandable/expandable.dart';

class OrderItem extends StatelessWidget {
  final OrderItemsModel item;

  const OrderItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      margin: EdgeInsets.fromLTRB(8, 5, 8, 5),
      child: Container(
        height: (item.itemsDetail != null) ? 160 : 130,
        child: Column(
          children: [
            (item.itemsDetail != null)
                ? firstRowCompost(context)
                : firstRowSimple(context),
            secoundRow(context),
          ],
        ),
      ),
    );
  }

  Widget firstRowSimple(BuildContext context) {
    final orderController = GetIt.I.get<OrderController>();
    return Container(
        height: 75,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: (item.linkUrl != null)
                  ? Image.network(item.linkUrl)
                  : Image.network(
                      "https://www.gestaowebsetes.com.br/images/no-image.png"),
            ),
            Expanded(
              flex: 9,
              child: AutoSizeText(
                item.description,
                minFontSize: 10,
                maxFontSize: 14,
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: IconButton(
                icon: Icon(Icons.remove_circle),
                onPressed: () => {
                  item.removeQtde(),
                  orderController.updateQtde(item),
                },
              ),
            ),
            Expanded(
                flex: 1,
                child: Observer(
                  builder: (_) {
                    return AutoSizeText(
                      item.qtde.toStringAsFixed(0),
                      minFontSize: 15,
                      maxFontSize: 18,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    );
                  },
                )),
            Expanded(
              flex: 2,
              child: IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: () => {
                  item.addQtde(),
                  orderController.updateQtde(item),
                },
              ),
            ),
          ],
        ));
  }

  Widget firstRowCompost(BuildContext context) {
    final orderController = GetIt.I.get<OrderController>();
    return Container(
        height: 110,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: (item.linkUrl != null)
                  ? Image.network(item.linkUrl)
                  : Image.network(
                      "https://www.gestaowebsetes.com.br/images/no-image.png"),
            ),
            Expanded(
              flex: 9,
              child: Container(
                alignment: Alignment.topLeft,
                height: 110,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          item.description,
                          minFontSize: 18,
                          maxFontSize: 18,
                          maxLines: 16,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    firstRowCompostItem(item.flavors, 3, 13),
                    firstRowCompostItem(item.itemsDetail[4].description, 1, 13),
                    firstRowCompostItem(item.itemsDetail[5].description, 1, 13),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: IconButton(
                icon: Icon(Icons.remove_circle),
                onPressed: () => {
                  item.removeQtde(),
                  orderController.updateQtde(item),
                },
              ),
            ),
            Expanded(
                flex: 1,
                child: Observer(
                  builder: (_) {
                    return AutoSizeText(
                      item.qtde.toStringAsFixed(0),
                      minFontSize: 15,
                      maxFontSize: 18,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    );
                  },
                )),
            Expanded(
              flex: 2,
              child: IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: () => {
                  item.addQtde(),
                  orderController.updateQtde(item),
                },
              ),
            ),
          ],
        ));
  }

  Widget firstRowCompostItem(String description, int maxLine, double fSize) {
    return Align(
      alignment: Alignment.topLeft,
      child: AutoSizeText(
        description,
        minFontSize: fSize - 5,
        maxFontSize: fSize,
        maxLines: maxLine,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: fSize,
        ),
      ),
    );
  }

  Widget secoundRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0Xff3a3a3a),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Color(0Xff3a3a3a)),
                ),
              ),
              child: Text('Remover',
                  style: TextStyle(color: Colors.white, fontSize: 12)),
              onPressed: () => {
                showAlertDialog(context),
              },
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Visibility(
              visible: (item.parts >= 1),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0Xff002434),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color(0Xff002434)),
                  ),
                ),
                child: Text('Editar',
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                onPressed: () => {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.PIZZA, arguments: item)
                },
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Observer(builder: (_) {
              return Text(
                'R\$ ' + (item.subTotal * item.qtde).toStringAsFixed(2),
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                    decorationColor: Colors.deepOrange,
                    decorationStyle: TextDecorationStyle.wavy,
                    color: Colors.deepOrange),
              );
            }),
          ),
        ),
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    final orderController = GetIt.I.get<OrderController>();
    // set up the buttons
    Widget cancelButton = ElevatedButton(
        child: Text("Cancela"),
        onPressed: () {
          Navigator.pop(context);
        });
    Widget continueButton = ElevatedButton(
      child: Text("Confirma"),
      onPressed: () {
        final registro = orderController.order.items.length;
        orderController.order.items.removeWhere((e) => e.id == item.id);
        orderController.getlistObservable();
        orderController.qtdeShoppingCart();
        if (registro == 1)
          Navigator.pushNamed(context, AppRoutes.HOME);
        else {
          Navigator.pop(context);
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirmação"),
      content: Text("Deseja excluir o item do Pedido?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget compostItem(BuildContext context) {
    return ExpandablePanel(
      header: AutoSizeText(
        item.description,
        minFontSize: 15,
        maxFontSize: 16,
        maxLines: 1,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      expanded: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            AutoSizeText(
              item.description,
              minFontSize: 15,
              maxFontSize: 16,
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            AutoSizeText(
              item.description,
              minFontSize: 15,
              maxFontSize: 16,
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
