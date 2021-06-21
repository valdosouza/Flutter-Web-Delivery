import 'package:delivery/controller/cal_ingredient_controller.dart';
import 'package:delivery/model/order_items_detail_rmv_model.dart';
import 'package:delivery/view/calzone/flavor/call_flavor_ingredients_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

// ignore: must_be_immutable
class CalFlavorIngredientList extends StatelessWidget {
  Widget widtget;

  CalIngredientController store = CalIngredientController();

  CalFlavorIngredientList() {
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
            final List<OrderItemsDetailRmvModel> posts = future.result;

            return RefreshIndicator(
              onRefresh: _refresh,
              child: Observer(builder: (_) {
                return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      print(post.description);
                      return CalFlavorIngredientItem(item: post);
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
