// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bev_main_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BevMainController on _BevMainController, Store {
  final _$measureAtom = Atom(name: '_BevMainController.measure');

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

  final _$validateAtom = Atom(name: '_BevMainController.validate');

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

  final _$msgvalidateAtom = Atom(name: '_BevMainController.msgvalidate');

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

  final _$validateFormAsyncAction =
      AsyncAction('_BevMainController.validateForm');

  @override
  Future<dynamic> validateForm() {
    return _$validateFormAsyncAction.run(() => super.validateForm());
  }

  @override
  String toString() {
    return '''
measure: ${measure},
validate: ${validate},
msgvalidate: ${msgvalidate}
    ''';
  }
}
