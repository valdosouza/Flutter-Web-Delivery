// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderController on _OrderController, Store {
  final _$observableItemsAtom = Atom(name: '_OrderController.observableItems');

  @override
  ObservableList<OrderItemsModel> get observableItems {
    _$observableItemsAtom.reportRead();
    return super.observableItems;
  }

  @override
  set observableItems(ObservableList<OrderItemsModel> value) {
    _$observableItemsAtom.reportWrite(value, super.observableItems, () {
      super.observableItems = value;
    });
  }

  final _$validateAtom = Atom(name: '_OrderController.validate');

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

  final _$msgvalidateAtom = Atom(name: '_OrderController.msgvalidate');

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

  final _$quantityAtom = Atom(name: '_OrderController.quantity');

  @override
  double get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(double value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  final _$resutadoSendOrderAtom =
      Atom(name: '_OrderController.resutadoSendOrder');

  @override
  ObservableFuture<String> get resutadoSendOrder {
    _$resutadoSendOrderAtom.reportRead();
    return super.resutadoSendOrder;
  }

  @override
  set resutadoSendOrder(ObservableFuture<String> value) {
    _$resutadoSendOrderAtom.reportWrite(value, super.resutadoSendOrder, () {
      super.resutadoSendOrder = value;
    });
  }

  final _$verifyItemsAsyncAction = AsyncAction('_OrderController.verifyItems');

  @override
  Future<dynamic> verifyItems() {
    return _$verifyItemsAsyncAction.run(() => super.verifyItems());
  }

  final _$validateFormAsyncAction =
      AsyncAction('_OrderController.validateForm');

  @override
  Future<dynamic> validateForm() {
    return _$validateFormAsyncAction.run(() => super.validateForm());
  }

  final _$_OrderControllerActionController =
      ActionController(name: '_OrderController');

  @override
  dynamic qtdeShoppingCart() {
    final _$actionInfo = _$_OrderControllerActionController.startAction(
        name: '_OrderController.qtdeShoppingCart');
    try {
      return super.qtdeShoppingCart();
    } finally {
      _$_OrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> sendOrder(OrderModel pOrder) {
    final _$actionInfo = _$_OrderControllerActionController.startAction(
        name: '_OrderController.sendOrder');
    try {
      return super.sendOrder(pOrder);
    } finally {
      _$_OrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observableItems: ${observableItems},
validate: ${validate},
msgvalidate: ${msgvalidate},
quantity: ${quantity},
resutadoSendOrder: ${resutadoSendOrder}
    ''';
  }
}
