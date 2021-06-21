import 'dart:async';

import 'package:delivery/controller/bev_items_controller.dart';
import 'package:delivery/view/beverage/items/bev_items_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

// ignore: must_be_immutable
class BevItemsList extends StatelessWidget {
  BevItemsController store = BevItemsController();

  Widget widtget;

  BevItemsList() {
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
                    'Falha em carregar dados',
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
            BevItemsController bevItemsController = BevItemsController();
            bevItemsController.listFiltered = future.result;

            bevItemsController.filter(future.result, '');
            final _mediaQueryData = MediaQuery.of(context);
            return RefreshIndicator(
              onRefresh: _refresh,
              child: Container(
                height: _mediaQueryData.size.height - 210,
                child: Observer(builder: (_) {
                  return ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: bevItemsController.listFiltered.length,
                      itemBuilder: (context, index) {
                        final post = bevItemsController.listFiltered[index];

                        return BevItemsItem(item: post);
                      });
                }),
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
