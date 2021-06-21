// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'piz_dough_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PizDoughController on _PizDoughController, Store {
  final _$itemsAtom = Atom(name: '_PizDoughController.items');

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
      Atom(name: '_PizDoughController.postsListFuture');

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

  final _$doughIdAtom = Atom(name: '_PizDoughController.doughId');

  @override
  int get doughId {
    _$doughIdAtom.reportRead();
    return super.doughId;
  }

  @override
  set doughId(int value) {
    _$doughIdAtom.reportWrite(value, super.doughId, () {
      super.doughId = value;
    });
  }

  final _$_PizDoughControllerActionController =
      ActionController(name: '_PizDoughController');

  @override
  Future<dynamic> fetchPosts() {
    final _$actionInfo = _$_PizDoughControllerActionController.startAction(
        name: '_PizDoughController.fetchPosts');
    try {
      return super.fetchPosts();
    } finally {
      _$_PizDoughControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
postsListFuture: ${postsListFuture},
doughId: ${doughId}
    ''';
  }
}
