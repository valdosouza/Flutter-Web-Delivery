import 'dart:async';
import 'package:delivery/controller/cal_flavor_controller.dart';
import 'package:delivery/view/calzone/flavor/cal_flavor_item.dart';
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
class CalFlavorList extends StatelessWidget {
  CalFlavorController store = CalFlavorController();
  var _searchFlavorController = TextEditingController();

  Widget widtget;

  CalFlavorList() {
    _searchFlavorController.clear();
    store.getThePosts();
  }
  filerList() async {
    final _debouncer = Debouncer(milliseconds: 500);
    if (_searchFlavorController.text.length >= 3) {
      _debouncer.run(() {
        this.store.filter(_searchFlavorController.text);
      });
    }
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
            this.store.filter('');
            final _mediaQueryData = MediaQuery.of(context);

            return RefreshIndicator(
              onRefresh: _refresh,
              child: Observer(builder: (_) {
                return Container(
                  height: _mediaQueryData.size.height,
                  child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: this.store.listFiltered.length,
                      itemBuilder: (context, index) {
                        final post = this.store.listFiltered[index];
                        return CalFlavorItem(item: post);
                      }),
                );
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
