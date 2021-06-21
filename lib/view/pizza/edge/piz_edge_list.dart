import 'package:delivery/controller/piz_edge_controller.dart';
import 'package:delivery/model/group_has_attribute_model.dart';
import 'package:delivery/view/pizza/edge/piz_edge_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

// ignore: must_be_immutable
class PizEdgeList extends StatelessWidget {
  PizEdgeController store = PizEdgeController();

  Widget widtget;

  PizEdgeList() {
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
                    'Falha ao carregar dados.',
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
            final List<GroupHasAttributeModel> posts = future.result;
            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return PizEdgeItem(item: post);
                },
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
