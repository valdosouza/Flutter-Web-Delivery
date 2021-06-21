// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MenuModel on _MenuModel, Store {
  final _$descriptionAtom = Atom(name: '_MenuModel.description');

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

  final _$priceTagAtom = Atom(name: '_MenuModel.priceTag');

  @override
  double get priceTag {
    _$priceTagAtom.reportRead();
    return super.priceTag;
  }

  @override
  set priceTag(double value) {
    _$priceTagAtom.reportWrite(value, super.priceTag, () {
      super.priceTag = value;
    });
  }

  final _$measureAtom = Atom(name: '_MenuModel.measure');

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

  final _$measureIdAtom = Atom(name: '_MenuModel.measureId');

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

  final _$linkUrlAtom = Atom(name: '_MenuModel.linkUrl');

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

  final _$qtdeAtom = Atom(name: '_MenuModel.qtde');

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

  final _$subTotalAtom = Atom(name: '_MenuModel.subTotal');

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

  @override
  String toString() {
    return '''
description: ${description},
priceTag: ${priceTag},
measure: ${measure},
measureId: ${measureId},
linkUrl: ${linkUrl},
qtde: ${qtde},
subTotal: ${subTotal}
    ''';
  }
}
