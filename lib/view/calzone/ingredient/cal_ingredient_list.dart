import 'package:delivery/controller/cal_ingredient_controller.dart';
import 'package:delivery/controller/cal_main_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'cal_ingredient_item.dart';

// ignore: must_be_immutable
class CalIngredientList extends StatelessWidget {
  Widget widtget;

  CalIngredientController store = CalIngredientController();

  CalIngredientList() {
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
            final cal = GetIt.I.get<CalMainController>();
            cal.fiilListIngredient(future);

            return RefreshIndicator(
              onRefresh: _refresh,
              child: Observer(builder: (_) {
                return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: cal
                        .item.itemsDetail[cal.indexFlavor].ingredRemove.length,
                    itemBuilder: (context, index) {
                      final post = cal.item.itemsDetail[cal.indexFlavor]
                          .ingredRemove[index];
                      return CalIngredientItem(item: post);
                    });
              }),
            );
            break;
        }
        return widtget;
      },
    );
  }

  Future _refresh() => store.fetchPosts();
}
