import 'package:delivery/controller/bev_rest_subgroup_controller.dart';
import 'package:delivery/model/rest_subgroup_model.dart';
import 'package:delivery/view/beverage/subgroup/bev_rest_subgroup_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

// ignore: must_be_immutable
class BevRestSubgroupList extends StatelessWidget {
  BevRestSubgroupController store = BevRestSubgroupController();

  Widget widtget;

  BevRestSubgroupList() {
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
            final List<RestSubgroupModel> posts = future.result;
            final _mediaQueryData = MediaQuery.of(context);
            return RefreshIndicator(
              onRefresh: _refresh,
              child: Container(
                height: _mediaQueryData.size.height - 150,
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];

                      return BevRestSubgroupItem(item: post);
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
