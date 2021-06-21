import 'package:delivery/controller/piz_main_controller.dart';
import 'package:delivery/controller/piz_optional_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'piz_optional_item.dart';

// ignore: must_be_immutable
class PizOptionalList extends StatelessWidget {
  int index;
  PizOptionalController store = PizOptionalController();

  Widget widtget;

  PizOptionalList(int index) {
    this.index = index;
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
            final piz = GetIt.I.get<PizMainController>();
            piz.fiilListOptional(future, this.index);

            return RefreshIndicator(
              onRefresh: _refresh,
              child: Observer(builder: (_) {
                return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount:
                        piz.item.itemsDetail[this.index].ingredOptional.length,
                    itemBuilder: (context, index) {
                      final post = piz
                          .item.itemsDetail[this.index].ingredOptional[index];
                      return PizOptionalItem(item: post);
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
