import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/component/components.dart';
import 'package:delivery/view/beverage/subgroup/bev_rest_subgroup_list.dart';

import 'package:flutter/material.dart';

class BevRestSubgroupMain extends StatefulWidget {
  @override
  _BevRestSubgroupMainState createState() => _BevRestSubgroupMainState();
}

class _BevRestSubgroupMainState extends State<BevRestSubgroupMain> {
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
      body: BevRestSubgroupList(),
      bottomSheet: appFinishBottom(context),
    );
  }
}
