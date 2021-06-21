import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/view/pizza/edge/piz_edge_list.dart';

import 'package:flutter/material.dart';

class PizEdgeMain extends StatefulWidget {
  @override
  _PizEdgeMainState createState() => _PizEdgeMainState();
}

class _PizEdgeMainState extends State<PizEdgeMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Lista de Bordas",
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
      body: PizEdgeList(),
    );
  }
}
