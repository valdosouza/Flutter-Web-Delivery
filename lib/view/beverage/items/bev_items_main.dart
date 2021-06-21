import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/component/components.dart';
import 'package:delivery/controller/bev_main_controller.dart';
import 'package:delivery/view/beverage/items/bev_items_list.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BevItemMain extends StatefulWidget {
  @override
  _BevItemMainState createState() => _BevItemMainState();
}

class _BevItemMainState extends State<BevItemMain> {
  @override
  Widget build(BuildContext context) {
    final bevMainController = GetIt.I.get<BevMainController>();
    return Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            "${bevMainController.chosenMenuDesc}",
            minFontSize: 8,
            maxFontSize: 20,
            maxLines: 1,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          backgroundColor: Color(0Xff002434),
          actions: <Widget>[
            shoppingCart(context),
          ],
        ),
        body: BevItemsList(),
        bottomSheet: orderBottom(context));
  }

  Widget orderBottom(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        height: 130,
        child: ListView(children: [
          appFinishBottom(context),
          orderKeepBuying(context),
        ]),
      ),
    );
  }
}
