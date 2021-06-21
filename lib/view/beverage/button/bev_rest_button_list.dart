import 'package:delivery/controller/bev_rest_button_controller.dart';
import 'package:delivery/model/rest_button_model.dart';
import 'package:delivery/view/beverage/button/bev_rest_button_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:responsive_grid/responsive_grid.dart';

// ignore: must_be_immutable
class BevRestButtonList extends StatelessWidget {
  BevRestButtonController store = BevRestButtonController();

  Widget widtget;

  BevRestButtonList() {
    store.getThePosts();
  }

  @override
  Widget build(BuildContext context) {
    final future = store.postsListFuture;

    return Observer(
      builder: (_) {
        switch (future.status) {
          case FutureStatus.pending:
            return Center(
              child: CircularProgressIndicator(),
            );

          case FutureStatus.rejected:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Falha em carregar os itens.',
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: const Text('Tente Novamente'),
                    onPressed: _refresh,
                  )
                ],
              ),
            );

          case FutureStatus.fulfilled:
            final List<RestButtonModel> posts = future.result;
            final _mediaQueryData = MediaQuery.of(context);
            return RefreshIndicator(
              onRefresh: _refresh,
              child: Container(
                height: _mediaQueryData.size.height - 150,
                child: SingleChildScrollView(
                  child: ResponsiveGridRow(children: [
                    for (RestButtonModel post in posts)
                      ResponsiveGridCol(
                        xs: 4,
                        child: BevRestButtonItem(item: post),
                      ),
                  ]),
                ),
              ),
            );
            break;
        }
        return widtget;
      },
    );
  }

  Future _refresh() => store.fetchPosts();
}
