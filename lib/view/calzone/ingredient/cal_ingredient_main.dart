import 'package:delivery/view/calzone/ingredient/cal_ingredient_list.dart';
import 'package:flutter/material.dart';

class CalIngredientMain extends StatefulWidget {
  @override
  _CalIngredientMainState createState() => _CalIngredientMainState();
}

class _CalIngredientMainState extends State<CalIngredientMain> {
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
      body: CalIngredientList(),
    );
  }
}
