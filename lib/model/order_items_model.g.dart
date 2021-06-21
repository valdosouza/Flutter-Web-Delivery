// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_items_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderItemsModel on _OrderItemsModel, Store {
  final _$idAtom = Atom(name: '_OrderItemsModel.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$menuIdAtom = Atom(name: '_OrderItemsModel.menuId');

  @override
  int get menuId {
    _$menuIdAtom.reportRead();
    return super.menuId;
  }

  @override
  set menuId(int value) {
    _$menuIdAtom.reportWrite(value, super.menuId, () {
      super.menuId = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_OrderItemsModel.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$flavorsAtom = Atom(name: '_OrderItemsModel.flavors');

  @override
  String get flavors {
    _$flavorsAtom.reportRead();
    return super.flavors;
  }

  @override
  set flavors(String value) {
    _$flavorsAtom.reportWrite(value, super.flavors, () {
      super.flavors = value;
    });
  }

  final _$measureIdAtom = Atom(name: '_OrderItemsModel.measureId');

  @override
  int get measureId {
    _$measureIdAtom.reportRead();
    return super.measureId;
  }

  @override
  set measureId(int value) {
    _$measureIdAtom.reportWrite(value, super.measureId, () {
      super.measureId = value;
    });
  }

  final _$measureAtom = Atom(name: '_OrderItemsModel.measure');

  @override
  String get measure {
    _$measureAtom.reportRead();
    return super.measure;
  }

  @override
  set measure(String value) {
    _$measureAtom.reportWrite(value, super.measure, () {
      super.measure = value;
    });
  }

  final _$qtdeAtom = Atom(name: '_OrderItemsModel.qtde');

  @override
  double get qtde {
    _$qtdeAtom.reportRead();
    return super.qtde;
  }

  @override
  set qtde(double value) {
    _$qtdeAtom.reportWrite(value, super.qtde, () {
      super.qtde = value;
    });
  }

  final _$subTotalAtom = Atom(name: '_OrderItemsModel.subTotal');

  @override
  double get subTotal {
    _$subTotalAtom.reportRead();
    return super.subTotal;
  }

  @override
  set subTotal(double value) {
    _$subTotalAtom.reportWrite(value, super.subTotal, () {
      super.subTotal = value;
    });
  }

  final _$partsAtom = Atom(name: '_OrderItemsModel.parts');

  @override
  int get parts {
    _$partsAtom.reportRead();
    return super.parts;
  }

  @override
  set parts(int value) {
    _$partsAtom.reportWrite(value, super.parts, () {
      super.parts = value;
    });
  }

  final _$partsMaxAtom = Atom(name: '_OrderItemsModel.partsMax');

  @override
  int get partsMax {
    _$partsMaxAtom.reportRead();
    return super.partsMax;
  }

  @override
  set partsMax(int value) {
    _$partsMaxAtom.reportWrite(value, super.partsMax, () {
      super.partsMax = value;
    });
  }

  final _$linkUrlAtom = Atom(name: '_OrderItemsModel.linkUrl');

  @override
  String get linkUrl {
    _$linkUrlAtom.reportRead();
    return super.linkUrl;
  }

  @override
  set linkUrl(String value) {
    _$linkUrlAtom.reportWrite(value, super.linkUrl, () {
      super.linkUrl = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
menuId: ${menuId},
description: ${description},
flavors: ${flavors},
measureId: ${measureId},
measure: ${measure},
qtde: ${qtde},
subTotal: ${subTotal},
parts: ${parts},
partsMax: ${partsMax},
linkUrl: ${linkUrl}
    ''';
  }
}
