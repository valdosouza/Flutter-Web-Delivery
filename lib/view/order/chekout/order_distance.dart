import 'package:flutter/material.dart';

Widget orderDistance(BuildContext context) {
  return Card(
    elevation: 10,
    margin: EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 8,
    ),
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(9.0),
            child: Image.asset('images/icon_checked_1.jpg'),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text(
                "Distância em km(s)",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text("desativado"),
          //customer.customer.distance.toStringAsFixed(2),
        ),
      ],
    ),
  );
}
