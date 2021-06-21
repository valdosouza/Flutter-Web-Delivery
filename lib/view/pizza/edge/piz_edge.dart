import 'package:delivery/controller/piz_main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../app_routes.dart';

class PizEdge extends StatelessWidget {
  final int index;
  PizEdge({this.index});
  @override
  Widget build(BuildContext context) {
    final pizMainController = GetIt.I.get<PizMainController>();
    return Observer(builder: (_) {
      return Visibility(
        visible: pizMainController.item.measure != "Escolha um Tamanho",
        child: Card(
          elevation: 15,
          margin: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Icon(
                    Icons.fiber_smart_record,
                    color: Color(0Xff86ca08),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Observer(builder: (_) {
                      return Text(
                        pizMainController
                            .item.itemsDetail[this.index].description,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_right),
                    onPressed: () => {
                      Navigator.pushNamed(context, AppRoutes.PIZFEDGEMAIN)
                          .whenComplete(() => pizMainController.sumTotal()),
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
