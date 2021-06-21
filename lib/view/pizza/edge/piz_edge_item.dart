import 'package:delivery/controller/piz_main_controller.dart';
import 'package:delivery/controller/piz_edge_controller.dart';
import 'package:delivery/model/group_has_attribute_model.dart';
import 'package:delivery/model/order_items_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class PizEdgeItem extends StatelessWidget {
  final GroupHasAttributeModel item;

  const PizEdgeItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pizMainController = GetIt.I.get<PizMainController>();
    final pizEdgeController = GetIt.I.get<PizEdgeController>();
    if (pizEdgeController.edgeId > 0) pizEdgeController.edgeId = 0;
    return Observer(
      builder: (_) {
        return Column(
          children: [
            RadioListTile(
              value: item.id,
              groupValue: pizEdgeController.edgeId,
              title: Text(item.description +
                  ' - R\$ ' +
                  item.priceTag.toStringAsFixed(2)),
              selected: (pizEdgeController.edgeId == item.id),
              activeColor: Colors.red,
              onChanged: (int value) {
                pizEdgeController.edgeId = value;
                pizMainController.editItemDetail(
                  OrderItemsDetailModel(
                    id: 5,
                    description: item.description,
                    kind: 'Borda',
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
