import 'package:delivery/app_routes.dart';
import 'package:delivery/controller/bev_main_controller.dart';

import 'package:delivery/model/rest_subgroup_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BevRestSubgroupItem extends StatelessWidget {
  final RestSubgroupModel item;

  const BevRestSubgroupItem({Key key, this.item}) : super(key: key);

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
        child: InkWell(
          onTap: () => {
            bevMainController.chosenSubGroup = item.description,
            Navigator.of(context).pushNamed(AppRoutes.BEVERAGEBUTTON),
          },
          child: ClipRRect(
            child: (item.linkUrl != null)
                ? Image.network(item.linkUrl)
                : Image.network(
                    'https://www.gestaowebsetes.com.br/images/no-image.png'),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
