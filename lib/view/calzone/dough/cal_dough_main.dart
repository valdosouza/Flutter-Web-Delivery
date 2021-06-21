import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/view/calzone/dough/cal_dough_list.dart';

import 'package:flutter/material.dart';

class CalDoughMain extends StatefulWidget {
  @override
  _CalDoughMainState createState() => _CalDoughMainState();
}

class _CalDoughMainState extends State<CalDoughMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Lista de Massas",
          minFontSize: 8,
          maxFontSize: 20,
          maxLines: 1,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: CalDoughList(),
    );
  }
}
