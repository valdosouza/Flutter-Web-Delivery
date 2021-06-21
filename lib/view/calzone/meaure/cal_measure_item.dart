import 'package:delivery/controller/cal_main_controller.dart';
import 'package:delivery/controller/cal_measure_controller.dart';
import 'package:delivery/model/measure_part_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CalMeasureItem extends StatelessWidget {
  final MeasurePartsModel item;

  const CalMeasureItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calMainController = GetIt.I.get<CalMainController>();
    final calMeasureController = GetIt.I.get<CalMeasureController>();

    if (calMeasureController.measureId > 0) calMeasureController.measureId = 0;
    return Observer(
      builder: (_) {
        return Column(
          children: [
            RadioListTile(
              value: item.id,
              groupValue: calMeasureController.measureId,
              title: Text(
                item.description,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              subtitle: (item.parts == 1)
                  ? Text("Escolha 1 sabor / ${item.slices} fatias")
                  : Text(
                      "Escolha até ${item.parts} sabores  / ${item.slices} fatias"),
              selected: calMeasureController.measureId == item.id,
              activeColor: Colors.deepOrange,
              onChanged: (int value) {
                if (calMainController.item.measureId != value) {
                  calMainController.resetSize();
                  calMainController.sumTotal();
                }
                calMeasureController.measureId = value;
                calMainController.item.measureId = value;
                calMainController.item.measure = item.description;
                calMainController.item.partsMax = item.parts;
                calMainController.setQttyflavorString();
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
