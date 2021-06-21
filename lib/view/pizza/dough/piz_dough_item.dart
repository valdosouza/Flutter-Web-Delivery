import 'package:delivery/controller/piz_main_controller.dart';
import 'package:delivery/controller/piz_dough_controller.dart';
import 'package:delivery/model/group_has_attribute_model.dart';
import 'package:delivery/model/order_items_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class PizDoughItem extends StatelessWidget {
  final GroupHasAttributeModel item;

  const PizDoughItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pizMainController = GetIt.I.get<PizMainController>();
    final pizDoughController = GetIt.I.get<PizDoughController>();
    if (pizDoughController.doughId > 0) pizDoughController.doughId = 0;
    return Observer(
      builder: (_) {
        return Column(
          children: [
            RadioListTile(
              value: item.id,
              groupValue: pizDoughController.doughId,
              title: (item.priceTag > 0.0)
                  ? Text(item.description +
                      ' - R\$ ' +
                      item.priceTag.toStringAsFixed(2))
                  : Text(item.description),
              selected: (pizDoughController.doughId == item.id),
              activeColor: Colors.red,
              onChanged: (int value) {
                pizDoughController.doughId = value;
                pizMainController.editItemDetail(
                  OrderItemsDetailModel(
                    id: 6,
                    description: item.description,
                    kind: 'Massa',
                    priceTag: item.priceTag,
                    check: true,
                  ),
                );
              },
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ],
        );
      },
    );
  }
}
