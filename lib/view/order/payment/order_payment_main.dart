import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/view/order/payment/order_payment_list.dart';
import 'package:flutter/material.dart';

class OrderPaymentMain extends StatefulWidget {
  @override
  _OrderPaymentMainState createState() => _OrderPaymentMainState();
}

class _OrderPaymentMainState extends State<OrderPaymentMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Lista de Formas de Pagamento",
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
      body: OrderPaymentList(),
    );
  }
}
