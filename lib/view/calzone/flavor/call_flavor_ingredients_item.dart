import 'package:delivery/model/order_items_detail_rmv_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalFlavorIngredientItem extends StatelessWidget {
  final OrderItemsDetailRmvModel item;

  const CalFlavorIngredientItem({Key key, this.item}) : super(key: key);

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
