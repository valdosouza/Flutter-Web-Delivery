import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/view/pizza/flavor/piz_flavor_list.dart';
import 'package:flutter/material.dart';

class PizFlavorMain extends StatefulWidget {
  @override
  _PizFlavorMainState createState() => _PizFlavorMainState();
}

class _PizFlavorMainState extends State<PizFlavorMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Lista de Sabores",
          minFontSize: 8,
          maxFontSize: 20,
          maxLines: 1,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Color(0Xff002434),
      ),
      body: PizFlavorList(),
    );
  }
}
