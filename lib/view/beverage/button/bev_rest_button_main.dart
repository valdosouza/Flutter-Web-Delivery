import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/component/components.dart';
import 'package:delivery/view/beverage/button/bev_rest_button_list.dart';

import 'package:flutter/material.dart';

class BevRestButtonMain extends StatefulWidget {
  @override
  _BevResttButtonMainState createState() => _BevResttButtonMainState();
}

class _BevResttButtonMainState extends State<BevRestButtonMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Bebidas",
          minFontSize: 8,
          maxFontSize: 20,
          maxLines: 1,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          shoppingCart(context),
        ],
      ),
      body: BevRestButtonList(),
      bottomSheet: appFinishBottom(context),
    );
  }
}
