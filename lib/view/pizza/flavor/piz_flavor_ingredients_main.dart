import 'package:delivery/view/pizza/flavor/piz_flavor_ingredients_list.dart';

import 'package:flutter/material.dart';

class PizFlavorIngredientsMain extends StatelessWidget {
  final int index;

  const PizFlavorIngredientsMain({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Ingredientes'),
        backgroundColor: Color(0Xff3a3a3a),
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
      body: PizFlavorIngredientList(this.index),
    );
  }
}
