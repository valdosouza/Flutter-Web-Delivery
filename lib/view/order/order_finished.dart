import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/app_routes.dart';
import 'package:delivery/component/drawer_component.dart';

import 'package:flutter/material.dart';

class OrderFinished extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => null,
      child: Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            "Delivery - Pedido Finalizado",
            minFontSize: 8,
            maxFontSize: 20,
            maxLines: 1,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          backgroundColor: Colors.deepOrange,
        ),
        drawer: DrawerComponent(),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: Image.asset('images/icon_checked_1.jpg'),
              ),
              Container(
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text(
                    "Pedido Finalizado com Sucesso",
                    style: TextStyle(fontSize: 18),
                    maxLines: 2,
                  ),
                ),
              ),
              Container(
                height: 100,
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                child: Image.network(
                  'https://www.gestaowebsetes.com.br/images/whatsapp-logo-1.png',
                  height: 100,
                ),
              ),
              Container(
                height: 100,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    "Utilize seu WhatsApp para acompanhar o Pedido",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Container(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0Xff002434),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color(0Xff002434)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.HOME);
                  },
                  child: Container(
                    height: 20,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Text('Efetuar novo Pedido',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
