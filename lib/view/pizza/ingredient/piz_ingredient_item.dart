//import 'package:delivery/controller/piz_ingredient_controller.dart';

import 'package:delivery/model/order_items_detail_rmv_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

//import 'package:provider/provider.dart';

class PizIngredientItem extends StatelessWidget {
  final OrderItemsDetailRmvModel item;

  const PizIngredientItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Text(
                  item.description,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Observer(builder: (_) {
                return Switch(
                  value: item.check,
                  onChanged: item.setCheck,
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                );
              }),
            ),
          ],
        ),
        Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ],
    );
  }
}
