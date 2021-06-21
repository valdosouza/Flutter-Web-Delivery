import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/app_routes.dart';
import 'package:delivery/controller/institution_controller.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DrawerComponent extends StatelessWidget {
  final institutionController = GetIt.I.get<InstitutionController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Colors.deepOrange, Colors.orangeAccent])),
            child: Container(
              height: 150,
              child: Column(
                children: <Widget>[
                  Center(
                    child: new Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  institutionController.institution.logo))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      institutionController.institution.name,
                      minFontSize: 8,
                      maxFontSize: 20,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          itemMenuDraw(Icons.view_list, 'Cardápio',
              () => {Navigator.pushNamed(context, AppRoutes.HOME)}),
          //itemMenuDraw(Icons.weekend, 'Meus Pedidos', () => {}),
          //itemMenuDraw(Icons.star, 'Promoções', () => {}),
          //itemMenuDraw(Icons.location_on, 'àrea de Entrega', () => {}),
          //itemMenuDraw(Icons.settings, 'Configurações', () => {}),
          //itemMenuDraw(Icons.person, 'Meus Dados', () => {}),
        ],
      ),
    );
  }

  // ignore: must_be_immutable
  Widget itemMenuDraw(IconData icon, String text, Function ontap) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
            splashColor: Colors.orangeAccent,
            onTap: ontap,
            child: Container(
              height: 50,
              child: Row(
                children: <Widget>[
                  Icon(icon),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 16.0),
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
