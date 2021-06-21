import 'package:delivery/controller/piz_ingredient_controller.dart';
import 'package:delivery/controller/piz_main_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'piz_ingredient_item.dart';

// ignore: must_be_immutable
class PizIngredientList extends StatelessWidget {
  Widget widtget;
  int index;
  PizIngredientController store = PizIngredientController();

  PizIngredientList(int index) {
    print(index);
    this.index = index;
    store.getThePosts(index);
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
            final piz = GetIt.I.get<PizMainController>();
            piz.fiilListIngredient(future, this.index);

            return RefreshIndicator(
              onRefresh: _refresh,
              child: Observer(builder: (_) {
                return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount:
                        piz.item.itemsDetail[this.index].ingredRemove.length,
                    itemBuilder: (context, index) {
                      final post =
                          piz.item.itemsDetail[this.index].ingredRemove[index];
                      return PizIngredientItem(item: post);
                    });
              }),
            );
            break;
        }
        return widtget;
      },
    );
  }

  Future _refresh() => store.fetchPosts(this.index);
}
