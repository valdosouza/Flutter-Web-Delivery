// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'piz_main_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PizMainController on _PizMainController, Store {
  final _$validateAtom = Atom(name: '_PizMainController.validate');

  @override
  bool get validate {
    _$validateAtom.reportRead();
    return super.validate;
  }

  @override
  set validate(bool value) {
    _$validateAtom.reportWrite(value, super.validate, () {
      super.validate = value;
    });
  }

  final _$msgvalidateAtom = Atom(name: '_PizMainController.msgvalidate');

  @override
  String get msgvalidate {
    _$msgvalidateAtom.reportRead();
    return super.msgvalidate;
  }

  @override
  set msgvalidate(String value) {
    _$msgvalidateAtom.reportWrite(value, super.msgvalidate, () {
      super.msgvalidate = value;
    });
  }

  final _$qttyflavorStringAtom =
      Atom(name: '_PizMainController.qttyflavorString');

  @override
  String get qttyflavorString {
    _$qttyflavorStringAtom.reportRead();
    return super.qttyflavorString;
  }

  @override
  set qttyflavorString(String value) {
    _$qttyflavorStringAtom.reportWrite(value, super.qttyflavorString, () {
      super.qttyflavorString = value;
    });
  }

  final _$edgeSelectedAtom = Atom(name: '_PizMainController.edgeSelected');

  @override
  bool get edgeSelected {
    _$edgeSelectedAtom.reportRead();
    return super.edgeSelected;
  }

  @override
  set edgeSelected(bool value) {
    _$edgeSelectedAtom.reportWrite(value, super.edgeSelected, () {
      super.edgeSelected = value;
    });
  }

  final _$listFlavorAtom = Atom(name: '_PizMainController.listFlavor');

  @override
  List<MenuModel> get listFlavor {
    _$listFlavorAtom.reportRead();
    return super.listFlavor;
  }

  @override
  set listFlavor(List<MenuModel> value) {
    _$listFlavorAtom.reportWrite(value, super.listFlavor, () {
      super.listFlavor = value;
    });
  }

  final _$validateFormAsyncAction =
      AsyncAction('_PizMainController.validateForm');

  @override
  Future<dynamic> validateForm() {
    return _$validateFormAsyncAction.run(() => super.validateForm());
  }

  final _$validateMenuIdAsyncAction =
      AsyncAction('_PizMainController.validateMenuId');

  @override
  Future<dynamic> validateMenuId(int index) {
    return _$validateMenuIdAsyncAction.run(() => super.validateMenuId(index));
  }

  final _$_PizMainControllerActionController =
      ActionController(name: '_PizMainController');

  @override
  void addItemDetail(OrderItemsDetailModel pItemDetail) {
    final _$actionInfo = _$_PizMainControllerActionController.startAction(
        name: '_PizMainController.addItemDetail');
    try {
      return super.addItemDetail(pItemDetail);
    } finally {
      _$_PizMainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteItemDetail(OrderItemsDetailModel pItemDetail) {
    final _$actionInfo = _$_PizMainControllerActionController.startAction(
        name: '_PizMainController.deleteItemDetail');
    try {
      return super.deleteItemDetail(pItemDetail);
    } finally {
      _$_PizMainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQttyflavorString() {
    final _$actionInfo = _$_PizMainControllerActionController.startAction(
        name: '_PizMainController.setQttyflavorString');
    try {
      return super.setQttyflavorString();
    } finally {
      _$_PizMainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic existItemDetailbyDescription(String value) {
    final _$actionInfo = _$_PizMainControllerActionController.startAction(
        name: '_PizMainController.existItemDetailbyDescription');
    try {
      return super.existItemDetailbyDescription(value);
    } finally {
      _$_PizMainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addParts() {
    final _$actionInfo = _$_PizMainControllerActionController.startAction(
        name: '_PizMainController.addParts');
    try {
      return super.addParts();
    } finally {
      _$_PizMainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeParts(int index) {
    final _$actionInfo = _$_PizMainControllerActionController.startAction(
        name: '_PizMainController.removeParts');
    try {
      return super.removeParts(index);
    } finally {
      _$_PizMainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filter(String search, List<MenuModel> result) {
    final _$actionInfo = _$_PizMainControllerActionController.startAction(
        name: '_PizMainController.filter');
    try {
      return super.filter(search, result);
    } finally {
      _$_PizMainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fiilListIngredient(ObservableFuture<dynamic> res, int index) {
    final _$actionInfo = _$_PizMainControllerActionController.startAction(
        name: '_PizMainController.fiilListIngredient');
    try {
      return super.fiilListIngredient(res, index);
    } finally {
      _$_PizMainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fiilListOptional(ObservableFuture<dynamic> res, int index) {
    final _$actionInfo = _$_PizMainControllerActionController.startAction(
        name: '_PizMainController.fiilListOptional');
    try {
      return super.fiilListOptional(res, index);
    } finally {
      _$_PizMainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
validate: ${validate},
msgvalidate: ${msgvalidate},
qttyflavorString: ${qttyflavorString},
edgeSelected: ${edgeSelected},
listFlavor: ${listFlavor}
    ''';
  }
}
