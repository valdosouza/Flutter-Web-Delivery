import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/app_routes.dart';
import 'package:delivery/controller/cal_main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CalFlavor extends StatelessWidget {
  final int index;
  CalFlavor({this.index});
  @override
  Widget build(BuildContext context) {
    final calMainController = GetIt.I.get<CalMainController>();

    return Observer(builder: (_) {
      return Visibility(
        visible: calMainController.item.itemsDetail[this.index].check,
        child: Card(
          elevation: 15,
          margin: EdgeInsets.fromLTRB(20, 5, 8, 5),
          child: Container(
            height: 96,
            child: Column(
              children: [
                firstRow(context, index),
                secoundRow(context, index),
              ],
            ),
          ),
        ),
      );
    });
  }
}

Widget firstRow(BuildContext context, int index) {
  final calMainController = GetIt.I.get<CalMainController>();
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
          child: CircleAvatar(
            radius: 15,
            child: (calMainController.item.itemsDetail[index].description ==
                    "Escolha o Sabor")
                ? Image.asset('images/icon_question.jpg')
                : Image.asset('images/icon_checked_1.jpg'),
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
          child: Text(
            calMainController.item.itemsDetail[index].description,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: IconButton(
          icon: Icon(
            Icons.remove_circle,
            color: Colors.red,
          ),
          onPressed: () => {
            calMainController.removeParts(index),
            calMainController.sumTotal(),
          },
        ),
      ),
    ],
  );
}

Widget secoundRow(BuildContext context, int index) {
  final calMainController = GetIt.I.get<CalMainController>();
  return Row(
    children: [
      Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0Xff002434),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Color(0Xff002434)),
              ),
            ),
            child: AutoSizeText('Sabor',
                minFontSize: 7,
                maxFontSize: 12,
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 12)),
            onPressed: () => {
              calMainController.indexFlavor = index,
              Navigator.pushNamed(context, AppRoutes.CALFLAVORMAIN)
                  .whenComplete(() => calMainController.sumTotal()),
            },
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0Xff002434),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Color(0Xff002434)),
              ),
            ),
            child: AutoSizeText('Ingredientes',
                minFontSize: 7,
                maxFontSize: 12,
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 12)),
            onPressed: () => {
              calMainController.indexFlavor = index,
              Navigator.pushNamed(context, AppRoutes.CALINGREDIENTMAIN)
                  .whenComplete(() => calMainController.sumTotal()),
            },
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0Xff2f4538),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Color(0Xff2f4538)),
              ),
            ),
            child: AutoSizeText('Opcionais',
                minFontSize: 7,
                maxFontSize: 12,
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 12)),
            onPressed: () => {
              calMainController.indexFlavor = index,
              Navigator.pushNamed(context, AppRoutes.CALOPTIONALMAIN)
                  .whenComplete(() => calMainController.sumTotal()),
            },
          ),
        ),
      ),
    ],
  );
}
