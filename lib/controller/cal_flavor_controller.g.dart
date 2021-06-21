// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cal_flavor_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalFlavorController on _CalFlavorController, Store {
  final _$postsListFutureAtom =
      Atom(name: '_CalFlavorController.postsListFuture');

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

  final _$listFilteredAtom = Atom(name: '_CalFlavorController.listFiltered');

  @override
  List<MenuModel> get listFiltered {
    _$listFilteredAtom.reportRead();
    return super.listFiltered;
  }

  @override
  set listFiltered(List<MenuModel> value) {
    _$listFilteredAtom.reportWrite(value, super.listFiltered, () {
      super.listFiltered = value;
    });
  }

  final _$_CalFlavorControllerActionController =
      ActionController(name: '_CalFlavorController');

  @override
  dynamic filter(String search) {
    final _$actionInfo = _$_CalFlavorControllerActionController.startAction(
        name: '_CalFlavorController.filter');
    try {
      return super.filter(search);
    } finally {
      _$_CalFlavorControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchPosts() {
    final _$actionInfo = _$_CalFlavorControllerActionController.startAction(
        name: '_CalFlavorController.fetchPosts');
    try {
      return super.fetchPosts();
    } finally {
      _$_CalFlavorControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
postsListFuture: ${postsListFuture},
listFiltered: ${listFiltered}
    ''';
  }
}
