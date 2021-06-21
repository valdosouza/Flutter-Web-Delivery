import 'package:delivery/app_routes.dart';
import 'package:delivery/controller/bev_main_controller.dart';
import 'package:delivery/model/rest_button_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BevRestButtonItem extends StatelessWidget {
  final RestButtonModel item;

  const BevRestButtonItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bevMainController = GetIt.I.get<BevMainController>();
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
        width: 200,
        child: InkWell(
          onTap: () => {
            bevMainController.chosenMenuId = item.menuId,
            bevMainController.chosenMenuDesc = item.description,
            Navigator.of(context).pushNamed(AppRoutes.BEVERAGEITEMS),
          },
          child: ClipRRect(
            child: Image.network(item.linkUrl),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
