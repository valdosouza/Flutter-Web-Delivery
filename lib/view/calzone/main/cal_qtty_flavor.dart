import 'package:delivery/controller/cal_main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CalQttyFlavor extends StatelessWidget {
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
                  child: Icon(
                    Icons.favorite,
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
                    child: Observer(
                      builder: (_) {
                        return Text(
                          calMainController.qttyflavorString,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      calMainController.addParts();
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
