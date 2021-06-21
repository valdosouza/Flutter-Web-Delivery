// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cal_ingredient_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalIngredientController on _CalIngredientController, Store {
  final _$itemsAtom = Atom(name: '_CalIngredientController.items');

  @override
  List<MenuHasIngredientModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<MenuHasIngredientModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$postsListFutureAtom =
      Atom(name: '_CalIngredientController.postsListFuture');

  @override
  ObservableFuture<List<MenuHasIngredientModel>> get postsListFuture {
    _$postsListFutureAtom.reportRead();
    return super.postsListFuture;
  }

  @override
  set postsListFuture(ObservableFuture<List<MenuHasIngredientModel>> value) {
    _$postsListFutureAtom.reportWrite(value, super.postsListFuture, () {
      super.postsListFuture = value;
    });
  }

  final _$_CalIngredientControllerActionController =
      ActionController(name: '_CalIngredientController');

  @override
  Future<dynamic> fetchPosts() {
    final _$actionInfo = _$_CalIngredientControllerActionController.startAction(
        name: '_CalIngredientController.fetchPosts');
    try {
      return super.fetchPosts();
    } finally {
      _$_CalIngredientControllerActionController.endAction(_$actionInfo);
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
