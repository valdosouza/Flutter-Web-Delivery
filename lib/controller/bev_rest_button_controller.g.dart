// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bev_rest_button_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BevRestButtonController on _BevRestButtonController, Store {
  final _$postsListFutureAtom =
      Atom(name: '_BevRestButtonController.postsListFuture');

  @override
  ObservableFuture<List<RestButtonModel>> get postsListFuture {
    _$postsListFutureAtom.reportRead();
    return super.postsListFuture;
  }

  @override
  set postsListFuture(ObservableFuture<List<RestButtonModel>> value) {
    _$postsListFutureAtom.reportWrite(value, super.postsListFuture, () {
      super.postsListFuture = value;
    });
  }

  final _$_BevRestButtonControllerActionController =
      ActionController(name: '_BevRestButtonController');

  @override
  Future<dynamic> fetchPosts() {
    final _$actionInfo = _$_BevRestButtonControllerActionController.startAction(
        name: '_BevRestButtonController.fetchPosts');
    try {
      return super.fetchPosts();
    } finally {
      _$_BevRestButtonControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
postsListFuture: ${postsListFuture}
    ''';
  }
}
