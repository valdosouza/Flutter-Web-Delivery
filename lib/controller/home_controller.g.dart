// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$itemsAtom = Atom(name: '_HomeController.items');

  @override
  List<RestGroupModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<RestGroupModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$postsListFutureAtom = Atom(name: '_HomeController.postsListFuture');

  @override
  ObservableFuture<List<RestGroupModel>> get postsListFuture {
    _$postsListFutureAtom.reportRead();
    return super.postsListFuture;
  }

  @override
  set postsListFuture(ObservableFuture<List<RestGroupModel>> value) {
    _$postsListFutureAtom.reportWrite(value, super.postsListFuture, () {
      super.postsListFuture = value;
    });
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  Future<dynamic> fetchPosts() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.fetchPosts');
    try {
      return super.fetchPosts();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
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
