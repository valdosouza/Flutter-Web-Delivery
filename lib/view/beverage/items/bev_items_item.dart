import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/controller/order_controller.dart';
import 'package:delivery/model/order_items_model.dart';

import 'package:flutter/material.dart';
import 'package:delivery/model/menu_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class BevItemsItem extends StatefulWidget {
  final MenuModel item;

  const BevItemsItem({Key key, this.item}) : super(key: key);

  @override
  _BevItemsItemState createState() => _BevItemsItemState();
}

class _BevItemsItemState extends State<BevItemsItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      margin: EdgeInsets.fromLTRB(8, 5, 8, 5),
      child: Container(
        height: 96,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: (widget.item.linkUrl != null)
                  ? Image.network(widget.item.linkUrl)
                  : Image.network(
                      "https://www.gestaowebsetes.com.br/images/no-image.png"),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  firstRow(context),
                  secoundRow(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget firstRow(BuildContext context) {
    return Container(
      height: 40,
      child: Row(children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              widget.item.measure,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0Xff2f4538),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'R\$ ' + widget.item.priceTag.toStringAsFixed(2),
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Color(0Xff2f4538),
            ),
          ),
        ),
      ]),
    );
  }

  Widget secoundRow(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 2,
        child: IconButton(
          icon: Icon(Icons.remove_circle),
          onPressed: () =>
              {widget.item.removeQtde(), widget.item.sumSubtotal()},
        ),
      ),
      Expanded(
          flex: 1,
          child: Observer(
            builder: (_) {
              return AutoSizeText(
                widget.item.qtde.toStringAsFixed(0),
                minFontSize: 8,
                maxFontSize: 14,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              );
            },
          )),
      Expanded(
        flex: 2,
        child: IconButton(
          icon: Icon(Icons.add_circle),
          onPressed: () => {widget.item.addQtde(), widget.item.sumSubtotal()},
        ),
      ),
      Expanded(
        flex: 7,
        child: addItem(context),
      ),
    ]);
  }

  showMessageConclude(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Carrinho"),
          content: Text("Item Adicionado com Sucesso!!"),
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
    ).whenComplete(() => {
          widget.item.qtde = 0,
          widget.item.sumSubtotal(),
        });
  }

  Widget addItem(BuildContext context) {
    final orderController = GetIt.I.get<OrderController>();
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.lightGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.lightGreen),
            ),
          ),
          onPressed: (widget.item.subTotal > 0.0)
              ? () => {
                    orderController
                        .saveBeverage(OrderItemsModel(
                          id: 0,
                          menuId: widget.item.id,
                          description: widget.item.description,
                          measureId: widget.item.measureId,
                          measure: widget.item.measure,
                          parts: 0,
                          partsMax: 0,
                          qtde: widget.item.qtde,
                          subTotal: widget.item.priceTag,
                          linkUrl: widget.item.linkUrl,
                        ))
                        .whenComplete(() => {
                              orderController.qtdeShoppingCart(),
                              showMessageConclude(context),
                            }),
                  }
              : null,
          child: Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new AutoSizeText(
                  (widget.item.subTotal > 0.0)
                      ? 'Adicionar R\$ ' +
                          widget.item.subTotal.toStringAsFixed(2)
                      : 'Adicionar ',
                  minFontSize: 8,
                  maxFontSize: 14,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
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
