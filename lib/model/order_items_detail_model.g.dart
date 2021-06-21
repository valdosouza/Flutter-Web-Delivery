// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_items_detail_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderItemsDetailModel on _OrderItemsDetailModel, Store {
  final _$idAtom = Atom(name: '_OrderItemsDetailModel.id');

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

  final _$menuIdAtom = Atom(name: '_OrderItemsDetailModel.menuId');

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

  final _$descriptionAtom = Atom(name: '_OrderItemsDetailModel.description');

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

  final _$priceTagAtom = Atom(name: '_OrderItemsDetailModel.priceTag');

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

  final _$kindAtom = Atom(name: '_OrderItemsDetailModel.kind');

  @override
  String get kind {
    _$kindAtom.reportRead();
    return super.kind;
  }

  @override
  set kind(String value) {
    _$kindAtom.reportWrite(value, super.kind, () {
      super.kind = value;
    });
  }

  final _$noteAtom = Atom(name: '_OrderItemsDetailModel.note');

  @override
  String get note {
    _$noteAtom.reportRead();
    return super.note;
  }

  @override
  set note(String value) {
    _$noteAtom.reportWrite(value, super.note, () {
      super.note = value;
    });
  }

  final _$checkAtom = Atom(name: '_OrderItemsDetailModel.check');

  @override
  bool get check {
    _$checkAtom.reportRead();
    return super.check;
  }

  @override
  set check(bool value) {
    _$checkAtom.reportWrite(value, super.check, () {
      super.check = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
menuId: ${menuId},
description: ${description},
priceTag: ${priceTag},
kind: ${kind},
note: ${note},
check: ${check}
    ''';
  }
}
