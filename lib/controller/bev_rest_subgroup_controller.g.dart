// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bev_rest_subgroup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BevRestSubgroupController on _BevRestSubgroupController, Store {
  final _$itemsAtom = Atom(name: '_BevRestSubgroupController.items');

  @override
  List<RestSubgroupModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<RestSubgroupModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$postsListFutureAtom =
      Atom(name: '_BevRestSubgroupController.postsListFuture');

  @override
  ObservableFuture<List<RestSubgroupModel>> get postsListFuture {
    _$postsListFutureAtom.reportRead();
    return super.postsListFuture;
  }

  @override
  set postsListFuture(ObservableFuture<List<RestSubgroupModel>> value) {
    _$postsListFutureAtom.reportWrite(value, super.postsListFuture, () {
      super.postsListFuture = value;
    });
  }

  final _$_BevRestSubgroupControllerActionController =
      ActionController(name: '_BevRestSubgroupController');

  @override
  Future<dynamic> fetchPosts() {
    final _$actionInfo = _$_BevRestSubgroupControllerActionController
        .startAction(name: '_BevRestSubgroupController.fetchPosts');
    try {
      return super.fetchPosts();
    } finally {
      _$_BevRestSubgroupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
postsListFuture: ${postsListFuture}
    ''';
  }
}
