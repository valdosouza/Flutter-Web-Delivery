import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/model/order_items_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:delivery/model/menu_model.dart';

class PizFlavorItem extends StatelessWidget {
  final MenuModel item;
  const PizFlavorItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      margin: EdgeInsets.fromLTRB(8, 5, 8, 5),
      child: Container(
        height: 100,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: (item.linkUrl != '')
                  ? Image.network(item.linkUrl)
                  : Image.network(
                      "https://www.gestaowebsetes.com.br/images/appweb/delivery/icon_pizza.jpg"),
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
      height: 50,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: new AutoSizeText(
                item.description,
                minFontSize: 8,
                maxFontSize: 14,
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: new AutoSizeText(
              'R\$ ' + item.priceTag.toStringAsFixed(2),
              minFontSize: 8,
              maxFontSize: 14,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget secoundRow(BuildContext context) {
    return Container(
      height: 30,
      child: Row(children: [
        Expanded(
          flex: 3,
          child: buttonIngredients(context),
        ),
        Expanded(
          flex: 5,
          child: buttonAdd(context),
        ),
      ]),
    );
  }

  Widget buttonAdd(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(45, 0, 3, 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.lightGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.lightGreen),
          ),
        ),
        child: AutoSizeText(
          'Adicionar',
          minFontSize: 7,
          maxFontSize: 12,
          maxLines: 1,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        onPressed: () => {
          Navigator.pop(
              context,
              OrderItemsDetailModel(
                id: 0,
                menuId: item.id,
                description: item.description,
                kind: 'Sabor',
                priceTag: item.priceTag,
                check: true,
              )),
        },
      ),
    );
  }

  Widget buttonIngredients(BuildContext context) {
    return Visibility(
      visible: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0Xff3a3a3a),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Color(0Xff3a3a3a)),
            ),
          ),
          child: AutoSizeText('Ingredientes',
              minFontSize: 7,
              maxFontSize: 12,
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white, fontSize: 12)),
          onPressed: () => {},
        ),
      ),
    );
  }
}
