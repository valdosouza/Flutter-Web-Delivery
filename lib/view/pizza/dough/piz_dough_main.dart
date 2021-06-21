import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/view/pizza/dough/piz_dough_list.dart';

import 'package:flutter/material.dart';

class PizDoughMain extends StatefulWidget {
  @override
  _PizDoughMainState createState() => _PizDoughMainState();
}

class _PizDoughMainState extends State<PizDoughMain> {
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
      body: PizDoughList(),
    );
  }
}
