import 'package:delivery/controller/cal_dough_controller.dart';
import 'package:delivery/controller/cal_main_controller.dart';
import 'package:delivery/model/group_has_attribute_model.dart';
import 'package:delivery/model/order_items_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CalDoughItem extends StatelessWidget {
  final GroupHasAttributeModel item;

  const CalDoughItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calMainController = GetIt.I.get<CalMainController>();
    final calDoughController = GetIt.I.get<CalDoughController>();
    if (calDoughController.doughId > 0) calDoughController.doughId = 0;
    return Observer(
      builder: (_) {
        return Column(
          children: [
            RadioListTile(
              value: item.id,
              groupValue: calDoughController.doughId,
              title: (item.priceTag > 0.0)
                  ? Text(item.description +
                      ' - R\$ ' +
                      item.priceTag.toStringAsFixed(2))
                  : Text(item.description),
              selected: (calDoughController.doughId == item.id),
              activeColor: Colors.red,
              onChanged: (int value) {
                calDoughController.doughId = value;
                calMainController.editItemDetail(
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
