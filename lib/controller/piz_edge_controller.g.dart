// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'piz_edge_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PizEdgeController on _PizEdgeController, Store {
  final _$itemsAtom = Atom(name: '_PizEdgeController.items');

  @override
  List<GroupHasAttributeModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<GroupHasAttributeModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$postsListFutureAtom =
      Atom(name: '_PizEdgeController.postsListFuture');

  @override
  ObservableFuture<List<GroupHasAttributeModel>> get postsListFuture {
    _$postsListFutureAtom.reportRead();
    return super.postsListFuture;
  }

  @override
  set postsListFuture(ObservableFuture<List<GroupHasAttributeModel>> value) {
    _$postsListFutureAtom.reportWrite(value, super.postsListFuture, () {
      super.postsListFuture = value;
    });
  }

  final _$edgeIdAtom = Atom(name: '_PizEdgeController.edgeId');

  @override
  int get edgeId {
    _$edgeIdAtom.reportRead();
    return super.edgeId;
  }

  @override
  set edgeId(int value) {
    _$edgeIdAtom.reportWrite(value, super.edgeId, () {
      super.edgeId = value;
    });
  }

  final _$_PizEdgeControllerActionController =
      ActionController(name: '_PizEdgeController');

  @override
  Future<dynamic> fetchPosts() {
    final _$actionInfo = _$_PizEdgeControllerActionController.startAction(
        name: '_PizEdgeController.fetchPosts');
    try {
      return super.fetchPosts();
    } finally {
      _$_PizEdgeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
postsListFuture: ${postsListFuture},
edgeId: ${edgeId}
    ''';
  }
}
