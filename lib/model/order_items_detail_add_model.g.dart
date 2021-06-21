// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_items_detail_add_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderItemsDetailAddModel on _OrderItemsDetailAddModel, Store {
  final _$checkAtom = Atom(name: '_OrderItemsDetailAddModel.check');

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

  final _$_OrderItemsDetailAddModelActionController =
      ActionController(name: '_OrderItemsDetailAddModel');

  @override
  dynamic setCheck(bool value) {
    final _$actionInfo = _$_OrderItemsDetailAddModelActionController
        .startAction(name: '_OrderItemsDetailAddModel.setCheck');
    try {
      return super.setCheck(value);
    } finally {
      _$_OrderItemsDetailAddModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
check: ${check}
    ''';
  }
}
