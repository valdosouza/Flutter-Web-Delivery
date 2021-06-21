import 'package:delivery/app_routes.dart';
import 'package:delivery/controller/cal_main_controller.dart';
import 'package:delivery/controller/piz_main_controller.dart';
import 'package:delivery/model/order_items_model.dart';
import 'package:delivery/model/rest_group_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeItem extends StatelessWidget {
  final RestGroupModel groupItem;

  const HomeItem({Key key, this.groupItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderItemsModel item;

    return Card(
      elevation: 30,
      margin: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        child: InkWell(
          onTap: () => {
            switchLinkGroup(groupItem.description, context, item),
          },
          child: ClipRRect(
            child: (groupItem.linkUrl != null)
                ? Image.network(groupItem.linkUrl)
                : Image.network(
                    'https://www.gestaowebsetes.com.br/images/no-image.png'),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }

  void switchLinkGroup(
      String group, BuildContext context, OrderItemsModel item) {
    switch (group) {
      case "PIZZA":
        final pizMainController = GetIt.I.get<PizMainController>();
        pizMainController.clear();
        pizMainController.additem();
        Navigator.of(context)
            .pushNamed(AppRoutes.PIZZA, arguments: pizMainController.item);
        break;
      case "BEBIDA":
        Navigator.of(context)
            .pushNamed(AppRoutes.BEVERAGESUBGROUP, arguments: item);
        break;
      case "CALZONE":
        final calMainController = GetIt.I.get<CalMainController>();
        calMainController.clear();
        calMainController.additem();
        Navigator.of(context)
            .pushNamed(AppRoutes.CALZONE, arguments: calMainController.item);
        break;
    }
  }
}
