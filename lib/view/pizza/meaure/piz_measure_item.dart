import 'package:delivery/controller/piz_main_controller.dart';
import 'package:delivery/controller/piz_measure_controller.dart';
import 'package:delivery/model/measure_part_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class PizMeasureItem extends StatelessWidget {
  final MeasurePartsModel item;

  const PizMeasureItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pizMainController = GetIt.I.get<PizMainController>();
    final pizMeasureController = GetIt.I.get<PizMeasureController>();

    if (pizMeasureController.measureId > 0) pizMeasureController.measureId = 0;
    return Observer(
      builder: (_) {
        return Column(
          children: [
            RadioListTile(
              value: item.id,
              groupValue: pizMeasureController.measureId,
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
              selected: pizMeasureController.measureId == item.id,
              activeColor: Colors.deepOrange,
              onChanged: (int value) {
                if (pizMainController.item.measureId != value) {
                  pizMainController.resetSize();
                  pizMainController.sumTotal();
                }
                pizMeasureController.measureId = value;
                pizMainController.item.measureId = value;
                pizMainController.item.measure = item.description;
                pizMainController.item.partsMax = item.parts;
                pizMainController.setQttyflavorString();
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
