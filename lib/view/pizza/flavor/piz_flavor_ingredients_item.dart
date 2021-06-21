//import 'package:delivery/controller/piz_ingredient_controller.dart';

import 'package:delivery/model/order_items_detail_rmv_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:provider/provider.dart';

class PizFlavorIngredientItem extends StatelessWidget {
  final OrderItemsDetailRmvModel item;

  const PizFlavorIngredientItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Text(
            item.description,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ],
    );
  }
}
