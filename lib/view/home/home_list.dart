import 'package:delivery/controller/home_controller.dart';
import 'package:delivery/model/rest_group_model.dart';

import 'package:delivery/view/home/home_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:mobx/mobx.dart';

// ignore: must_be_immutable
class HomeList extends StatelessWidget {
  HomeController store = HomeController();

  Widget widtget;

  HomeList() {
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
            final List<RestGroupModel> posts = future.result;
            final _mediaQueryData = MediaQuery.of(context);
            return RefreshIndicator(
              onRefresh: _refresh,
              child: Container(
                height: _mediaQueryData.size.height,
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return HomeItem(groupItem: post);
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
