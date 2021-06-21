import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/component/components.dart';
import 'package:delivery/component/drawer_component.dart';
import 'package:delivery/controller/customer_controller.dart';

import 'package:delivery/controller/institution_controller.dart';
import 'package:delivery/view/home/home_disable.dart';

import 'package:delivery/view/home/home_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  String institution;
  String phone;

  final institutionController = GetIt.I.get<InstitutionController>();
  final customerController = GetIt.I.get<CustomerController>();
  Widget widtget;

  Home({this.institution, this.phone}) {
    //if (this.institution == '') this.institution = '6820';
    //if (this.phone == '') this.phone = '99112072';
    if (this.phone != '') customerController.getPosts(this.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Observer(builder: (_) {
            return AutoSizeText(
              institutionController.titleApp,
              minFontSize: 8,
              maxFontSize: 20,
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20.0,
              ),
            );
          }),
          backgroundColor: Colors.deepOrange,
          actions: <Widget>[
            shoppingCart(context),
          ],
        ),
        drawer: DrawerComponent(),
        body: FutureBuilder(
          future: institutionController.getPosts(this.institution),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (institutionController.institution.active == 'S') {
                return HomeList();
              } else {
                return HomeDisable();
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        bottomSheet: (institutionController.institution.active == 'S')
            ? appFinishBottom(context)
            : null);
  }
}
