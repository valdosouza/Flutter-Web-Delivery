import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/view/pizza/meaure/piz_measure_list.dart';

import 'package:flutter/material.dart';

class PizMeasureMain extends StatefulWidget {
  @override
  _PizMeasureMainState createState() => _PizMeasureMainState();
}

class _PizMeasureMainState extends State<PizMeasureMain> {
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
      body: PizMeasureList(),
    );
  }
}
