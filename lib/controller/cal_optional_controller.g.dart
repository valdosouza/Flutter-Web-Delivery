// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cal_optional_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalOptionalController on _CalOptionalController, Store {
  final _$itemsAtom = Atom(name: '_CalOptionalController.items');

  @override
  List<GroupHasOptionalModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<GroupHasOptionalModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$postsListFutureAtom =
      Atom(name: '_CalOptionalController.postsListFuture');

  @override
  ObservableFuture<List<GroupHasOptionalModel>> get postsListFuture {
    _$postsListFutureAtom.reportRead();
    return super.postsListFuture;
  }

  @override
  set postsListFuture(ObservableFuture<List<GroupHasOptionalModel>> value) {
    _$postsListFutureAtom.reportWrite(value, super.postsListFuture, () {
      super.postsListFuture = value;
    });
  }

  final _$_CalOptionalControllerActionController =
      ActionController(name: '_CalOptionalController');

  @override
  Future<dynamic> fetchPosts() {
    final _$actionInfo = _$_CalOptionalControllerActionController.startAction(
        name: '_CalOptionalController.fetchPosts');
    try {
      return super.fetchPosts();
    } finally {
      _$_CalOptionalControllerActionController.endAction(_$actionInfo);
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
