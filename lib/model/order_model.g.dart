// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderModel on _OrderModel, Store {
  final _$subtotalValueAtom = Atom(name: '_OrderModel.subtotalValue');

  @override
  double get subtotalValue {
    _$subtotalValueAtom.reportRead();
    return super.subtotalValue;
  }

  @override
  set subtotalValue(double value) {
    _$subtotalValueAtom.reportWrite(value, super.subtotalValue, () {
      super.subtotalValue = value;
    });
  }

  final _$kindAttendanceAtom = Atom(name: '_OrderModel.kindAttendance');

  @override
  int get kindAttendance {
    _$kindAttendanceAtom.reportRead();
    return super.kindAttendance;
  }

  @override
  set kindAttendance(int value) {
    _$kindAttendanceAtom.reportWrite(value, super.kindAttendance, () {
      super.kindAttendance = value;
    });
  }

  final _$deliveryValueAtom = Atom(name: '_OrderModel.deliveryValue');

  @override
  double get deliveryValue {
    _$deliveryValueAtom.reportRead();
    return super.deliveryValue;
  }

  @override
  set deliveryValue(double value) {
    _$deliveryValueAtom.reportWrite(value, super.deliveryValue, () {
      super.deliveryValue = value;
    });
  }

  final _$totalValueAtom = Atom(name: '_OrderModel.totalValue');

  @override
  double get totalValue {
    _$totalValueAtom.reportRead();
    return super.totalValue;
  }

  @override
  set totalValue(double value) {
    _$totalValueAtom.reportWrite(value, super.totalValue, () {
      super.totalValue = value;
    });
  }

  final _$paymentTypeAtom = Atom(name: '_OrderModel.paymentType');

  @override
  String get paymentType {
    _$paymentTypeAtom.reportRead();
    return super.paymentType;
  }

  @override
  set paymentType(String value) {
    _$paymentTypeAtom.reportWrite(value, super.paymentType, () {
      super.paymentType = value;
    });
  }

  final _$changeValueAtom = Atom(name: '_OrderModel.changeValue');

  @override
  double get changeValue {
    _$changeValueAtom.reportRead();
    return super.changeValue;
  }

  @override
  set changeValue(double value) {
    _$changeValueAtom.reportWrite(value, super.changeValue, () {
      super.changeValue = value;
    });
  }

  final _$_OrderModelActionController = ActionController(name: '_OrderModel');

  @override
  dynamic setInstitutionID(int value) {
    final _$actionInfo = _$_OrderModelActionController.startAction(
        name: '_OrderModel.setInstitutionID');
    try {
      return super.setInstitutionID(value);
    } finally {
      _$_OrderModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCustomer(Customer value) {
    final _$actionInfo = _$_OrderModelActionController.startAction(
        name: '_OrderModel.setCustomer');
    try {
      return super.setCustomer(value);
    } finally {
      _$_OrderModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
subtotalValue: ${subtotalValue},
kindAttendance: ${kindAttendance},
deliveryValue: ${deliveryValue},
totalValue: ${totalValue},
paymentType: ${paymentType},
changeValue: ${changeValue}
    ''';
  }
}
