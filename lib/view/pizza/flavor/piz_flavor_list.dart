import 'dart:async';

import 'package:delivery/controller/piz_flavor_controller.dart';
import 'package:delivery/controller/piz_main_controller.dart';
import 'package:delivery/view/pizza/flavor/piz_flavor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

// ignore: must_be_immutable
class PizFlavorList extends StatefulWidget {
  @override
  _PizFlavorListState createState() => _PizFlavorListState();
}

class _PizFlavorListState extends State<PizFlavorList> {
  PizFlavorController store = PizFlavorController();
  final pizMainController = GetIt.I.get<PizMainController>();
  TextEditingController _searchQuery = TextEditingController();
  _PizFlavorListState() {
    _searchQuery.clear();
    store.getThePosts();
  }

  Widget widtget;

  @override
  Widget build(BuildContext context) {
    final future = store.postsListFuture;
    final _mediaQueryData = MediaQuery.of(context);
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
            pizMainController.filter('', this.store.menuModel);

            return RefreshIndicator(
              onRefresh: _refresh,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildSearchField(),
                    _buildListItems(_mediaQueryData.size.height - 173),
                  ],
                ),
              ),
            );
            break;
        }
        return widtget;
      },
    );
  }

  Future _refresh() => store.fetchPosts();

  Widget _buildListItems(double height) {
    return new Observer(builder: (_) {
      return Container(
        height: height,
        child: ListView.builder(
            itemCount: pizMainController.listFlavor == null
                ? 0
                : pizMainController.listFlavor.length,
            itemBuilder: (context, index) {
              final post = pizMainController.listFlavor[index];
              return PizFlavorItem(item: post);
            }),
      );
    });
  }

  Widget _buildSearchField() {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextField(
          controller: _searchQuery,
          enabled: true,
          autofocus: false,
          maxLines: 1,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          onChanged: (value) => {
            filerList(),
          },
          decoration: InputDecoration(
            hintText: 'Pesquise por sabor',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
              ),
            ),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }

  filerList() async {
    if (_searchQuery.text != null) {
      if (_searchQuery.text.isNotEmpty) {
        if (_searchQuery.text.length >= 3) {
          pizMainController.filter(_searchQuery.text, this.store.menuModel);
          //this.store.filter(_searchQuery.text);
        } else {
          pizMainController.filter('', this.store.menuModel);
        }
      }
    }
  }
}
