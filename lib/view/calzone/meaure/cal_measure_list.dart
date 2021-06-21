import 'package:delivery/controller/cal_measure_controller.dart';
import 'package:delivery/model/measure_part_model.dart';
import 'package:delivery/view/calzone/meaure/cal_measure_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

// ignore: must_be_immutable
class CalMeasureList extends StatelessWidget {
  CalMeasureController store = CalMeasureController();

  Widget widtget;

  CalMeasureList() {
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
                    'Falha ao carregar os tamanhos.',
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
            final List<MeasurePartsModel> posts = future.result;
            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];

                  return CalMeasureItem(item: post);
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
