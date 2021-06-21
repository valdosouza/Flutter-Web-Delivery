// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'piz_flavor_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PizFlavorController on _PizFlavorController, Store {
  final _$postsListFutureAtom =
      Atom(name: '_PizFlavorController.postsListFuture');

  @override
  ObservableFuture<List<MenuModel>> get postsListFuture {
    _$postsListFutureAtom.reportRead();
    return super.postsListFuture;
  }

  @override
  set postsListFuture(ObservableFuture<List<MenuModel>> value) {
    _$postsListFutureAtom.reportWrite(value, super.postsListFuture, () {
      super.postsListFuture = value;
    });
  }

  final _$_PizFlavorControllerActionController =
      ActionController(name: '_PizFlavorController');

  @override
  Future<dynamic> fetchPosts() {
    final _$actionInfo = _$_PizFlavorControllerActionController.startAction(
        name: '_PizFlavorController.fetchPosts');
    try {
      return super.fetchPosts();
    } finally {
      _$_PizFlavorControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
postsListFuture: ${postsListFuture}
    ''';
  }
}
