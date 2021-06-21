import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/view/calzone/flavor/cal_flavor_list.dart';
import 'package:flutter/material.dart';

class CalFlavorMain extends StatefulWidget {
  @override
  _CalFlavorMainState createState() => _CalFlavorMainState();
}

class _CalFlavorMainState extends State<CalFlavorMain> {
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
      body: CalFlavorList(),
    );
  }
}
