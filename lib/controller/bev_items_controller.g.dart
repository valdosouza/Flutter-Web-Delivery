// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bev_items_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BevItemsController on _BevItemsController, Store {
  final _$menuDescAtom = Atom(name: '_BevItemsController.menuDesc');

  @override
  String get menuDesc {
    _$menuDescAtom.reportRead();
    return super.menuDesc;
  }

  @override
  set menuDesc(String value) {
    _$menuDescAtom.reportWrite(value, super.menuDesc, () {
      super.menuDesc = value;
    });
  }

  final _$postsListFutureAtom =
      Atom(name: '_BevItemsController.postsListFuture');

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

  final _$listFilteredAtom = Atom(name: '_BevItemsController.listFiltered');

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

  final _$_BevItemsControllerActionController =
      ActionController(name: '_BevItemsController');

  @override
  dynamic filter(List<MenuModel> list, String search) {
    final _$actionInfo = _$_BevItemsControllerActionController.startAction(
        name: '_BevItemsController.filter');
    try {
      return super.filter(list, search);
    } finally {
      _$_BevItemsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchPosts() {
    final _$actionInfo = _$_BevItemsControllerActionController.startAction(
        name: '_BevItemsController.fetchPosts');
    try {
      return super.fetchPosts();
    } finally {
      _$_BevItemsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
menuDesc: ${menuDesc},
postsListFuture: ${postsListFuture},
listFiltered: ${listFiltered}
    ''';
  }
}
