// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cal_main_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalMainController on _CalMainController, Store {
  Computed<String> _$flavorDescriptionComputed;

  @override
  String get flavorDescription => (_$flavorDescriptionComputed ??=
          Computed<String>(() => super.flavorDescription,
              name: '_CalMainController.flavorDescription'))
      .value;
  Computed<int> _$menuidComputed;

  @override
  int get menuid => (_$menuidComputed ??=
          Computed<int>(() => super.menuid, name: '_CalMainController.menuid'))
      .value;

  final _$validateAtom = Atom(name: '_CalMainController.validate');

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

  final _$msgvalidateAtom = Atom(name: '_CalMainController.msgvalidate');

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
      Atom(name: '_CalMainController.qttyflavorString');

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

  final _$indexFlavorAtom = Atom(name: '_CalMainController.indexFlavor');

  @override
  int get indexFlavor {
    _$indexFlavorAtom.reportRead();
    return super.indexFlavor;
  }

  @override
  set indexFlavor(int value) {
    _$indexFlavorAtom.reportWrite(value, super.indexFlavor, () {
      super.indexFlavor = value;
    });
  }

  final _$edgeSelectedAtom = Atom(name: '_CalMainController.edgeSelected');

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

  final _$validateFormAsyncAction =
      AsyncAction('_CalMainController.validateForm');

  @override
  Future<dynamic> validateForm() {
    return _$validateFormAsyncAction.run(() => super.validateForm());
  }

  final _$_CalMainControllerActionController =
      ActionController(name: '_CalMainController');

  @override
  void addItemDetail(OrderItemsDetailModel pItemDetail) {
    final _$actionInfo = _$_CalMainControllerActionController.startAction(
        name: '_CalMainController.addItemDetail');
    try {
      return super.addItemDetail(pItemDetail);
    } finally {
      _$_CalMainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteItemDetail(OrderItemsDetailModel pItemDetail) {
    final _$actionInfo = _$_CalMainControllerActionController.startAction(
        name: '_CalMainController.deleteItemDetail');
    try {
      return super.deleteItemDetail(pItemDetail);
    } finally {
      _$_CalMainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQttyflavorString() {
    final _$actionInfo = _$_CalMainControllerActionController.startAction(
        name: '_CalMainController.setQttyflavorString');
    try {
      return super.setQttyflavorString();
    } finally {
      _$_CalMainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic existItemDetailbyDescription(String value) {
    final _$actionInfo = _$_CalMainControllerActionController.startAction(
        name: '_CalMainController.existItemDetailbyDescription');
    try {
      return super.existItemDetailbyDescription(value);
    } finally {
      _$_CalMainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addParts() {
    final _$actionInfo = _$_CalMainControllerActionController.startAction(
        name: '_CalMainController.addParts');
    try {
      return super.addParts();
    } finally {
      _$_CalMainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeParts(int index) {
    final _$actionInfo = _$_CalMainControllerActionController.startAction(
        name: '_CalMainController.removeParts');
    try {
      return super.removeParts(index);
    } finally {
      _$_CalMainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic adjustParts() {
    final _$actionInfo = _$_CalMainControllerActionController.startAction(
        name: '_CalMainController.adjustParts');
    try {
      return super.adjustParts();
    } finally {
      _$_CalMainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fiilListIngredient(ObservableFuture<dynamic> res) {
    final _$actionInfo = _$_CalMainControllerActionController.startAction(
        name: '_CalMainController.fiilListIngredient');
    try {
      return super.fiilListIngredient(res);
    } finally {
      _$_CalMainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fiilListOptional(ObservableFuture<dynamic> res) {
    final _$actionInfo = _$_CalMainControllerActionController.startAction(
        name: '_CalMainController.fiilListOptional');
    try {
      return super.fiilListOptional(res);
    } finally {
      _$_CalMainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
validate: ${validate},
msgvalidate: ${msgvalidate},
qttyflavorString: ${qttyflavorString},
indexFlavor: ${indexFlavor},
edgeSelected: ${edgeSelected},
flavorDescription: ${flavorDescription},
menuid: ${menuid}
    ''';
  }
}
