import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/view/pizza/optional/piz_optional_list.dart';

import 'package:flutter/material.dart';

class PizOptionalMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Lista de Opcionais",
          minFontSize: 8,
          maxFontSize: 20,
          maxLines: 1,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Color(0Xff2f4538),
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
      body: PizOptionalList(index),
    );
  }
}
