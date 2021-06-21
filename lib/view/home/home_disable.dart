import 'package:flutter/material.dart';

class HomeDisable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Text(
                "Aplicativo está em Manutenção",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 120,
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: Image.network(
              'https://www.gestaowebsetes.com.br/images/whatsapp-logo-1.png',
              height: 120,
            ),
          ),
          Container(
            height: 100,
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Text(
                "Utilize seu WhatsApp para fazer seu pedido",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
