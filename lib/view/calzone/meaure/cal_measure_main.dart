import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/view/calzone/meaure/cal_measure_list.dart';

import 'package:flutter/material.dart';

class CalMeasureMain extends StatefulWidget {
  @override
  _CalMeasureMainState createState() => _CalMeasureMainState();
}

class _CalMeasureMainState extends State<CalMeasureMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Lista de Tamanhos",
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
      body: CalMeasureList(),
    );
  }
}
