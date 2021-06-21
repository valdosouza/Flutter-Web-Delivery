import 'package:delivery/app_routes.dart';
import 'package:delivery/controller/cal_main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CalDough extends StatelessWidget {
  final int index;
  CalDough({this.index});
  @override
  Widget build(BuildContext context) {
    final calMainController = GetIt.I.get<CalMainController>();
    return Observer(builder: (_) {
      return Visibility(
        visible: calMainController.item.measure != "Escolha um Tamanho",
        child: Card(
          elevation: 10,
          margin: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(9.0),
                  child: Icon(
                    Icons.star_rounded,
                    color: Color(0Xff86ca08),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Observer(builder: (_) {
                      return Text(
                        calMainController
                            .item.itemsDetail[this.index].description,
                        style: TextStyle(
                          fontSize: 18.0,
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
                      Navigator.pushNamed(context, AppRoutes.CALDOUGHMAIN)
                          .whenComplete(() => calMainController.sumTotal()),
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
