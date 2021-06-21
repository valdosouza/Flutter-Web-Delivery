// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cal_dough_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalDoughController on _CalDoughController, Store {
  final _$itemsAtom = Atom(name: '_CalDoughController.items');

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
      Atom(name: '_CalDoughController.postsListFuture');

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

  final _$doughIdAtom = Atom(name: '_CalDoughController.doughId');

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

  final _$_CalDoughControllerActionController =
      ActionController(name: '_CalDoughController');

  @override
  Future<dynamic> fetchPosts() {
    final _$actionInfo = _$_CalDoughControllerActionController.startAction(
        name: '_CalDoughController.fetchPosts');
    try {
      return super.fetchPosts();
    } finally {
      _$_CalDoughControllerActionController.endAction(_$actionInfo);
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
