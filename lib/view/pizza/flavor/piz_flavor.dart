import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/app_routes.dart';
import 'package:delivery/controller/piz_main_controller.dart';
import 'package:delivery/model/order_items_detail_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class PizFlavor extends StatelessWidget {
  final int index;
  PizFlavor({this.index});
  @override
  Widget build(BuildContext context) {
    final pizMainController = GetIt.I.get<PizMainController>();

    return Observer(builder: (_) {
      return Visibility(
        visible: pizMainController.item.itemsDetail[this.index].check,
        child: Card(
          elevation: 15,
          margin: EdgeInsets.fromLTRB(20, 5, 8, 5),
          child: Container(
            height: 96,
            child: Column(
              children: [
                firstRow(context, index),
                secoundRow(context, index),
              ],
            ),
          ),
        ),
      );
    });
  }
}

Widget firstRow(BuildContext context, int index) {
  final pizMainController = GetIt.I.get<PizMainController>();
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
          child: CircleAvatar(
            radius: 15,
            child: (pizMainController.item.itemsDetail[index].description ==
                    "Escolha o Sabor")
                ? Image.asset('images/icon_question.jpg')
                : Image.asset('images/icon_checked_1.jpg'),
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
          child: Text(
            pizMainController.item.itemsDetail[index].description,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: IconButton(
          icon: Icon(
            Icons.remove_circle,
            color: Colors.red,
          ),
          onPressed: () => {
            pizMainController.removeParts(index),
            pizMainController.sumTotal(),
          },
        ),
      ),
    ],
  );
}

Widget secoundRow(BuildContext context, int index) {
  final pizMainController = GetIt.I.get<PizMainController>();
  OrderItemsDetailModel itemD;
  return Row(
    children: [
      Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0Xff002434),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Color(0Xff002434)),
              ),
            ),
            child: AutoSizeText('Sabor',
                minFontSize: 7,
                maxFontSize: 12,
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 12)),
            onPressed: () => {
              Navigator.pushNamed(context, AppRoutes.PIZFLAVORMAIN)
                  .then((item) => {
                        itemD = item,
                        itemD.id = index + 1,
                        pizMainController.editItemDetail(itemD),
                        pizMainController.sumTotal(),
                      }),
            },
          ),
        ),
      ),
      Expanded(
        flex: 3,
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
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 12)),
            onPressed: () => {
              pizMainController.validateMenuId(index).then((_) {
                if (!pizMainController.validate) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Validação do Sabor"),
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
                  Navigator.pushNamed(context, AppRoutes.PIZINGREDIENTMAIN,
                          arguments: index)
                      .whenComplete(() => pizMainController.sumTotal());
                }
              }),
            },
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0Xff2f4538),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Color(0Xff2f4538)),
              ),
            ),
            child: AutoSizeText('Opcionais',
                minFontSize: 7,
                maxFontSize: 12,
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 12)),
            onPressed: () => {
              pizMainController.validateMenuId(index).then((_) {
                if (!pizMainController.validate) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Validação do Sabor"),
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
                  Navigator.pushNamed(context, AppRoutes.PIZOPTIONALMAIN,
                          arguments: index)
                      .whenComplete(() => pizMainController.sumTotal());
                }
              }),
            },
          ),
        ),
      ),
    ],
  );
}
