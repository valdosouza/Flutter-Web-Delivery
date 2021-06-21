import 'package:delivery/controller/cal_main_controller.dart';
import 'package:flutter/material.dart';
import 'package:delivery/app_routes.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CalMeasure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calMainController = GetIt.I.get<CalMainController>();

    return Card(
      elevation: 20,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Observer(builder: (_) {
              return Container(
                padding: const EdgeInsets.all(10), // fromLTRB(5, 5, 5, 5),
                child: getImage(calMainController.item.measure),
              );
            }),
          ),
          Expanded(
            flex: 6,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Observer(builder: (_) {
                  return Text(
                    calMainController.item.measure,
                    style: TextStyle(fontSize: 18.0),
                  );
                }),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                //color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                onPressed: () => {
                  Navigator.pushNamed(context, AppRoutes.CALMEASUREMAIN)
                      .whenComplete(() => {
                            calMainController.adjustParts(),
                          })
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Image getImage(String size) {
  if (size == "Escolha um Tamanho") {
    return Image.asset('images/icon_question.jpg');
  } else {
    return Image.asset('images/icon_checked_1.jpg');
  }
}
