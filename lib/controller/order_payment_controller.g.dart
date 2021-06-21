// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_payment_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderPaymentController on _OrderPaymentController, Store {
  final _$itemsAtom = Atom(name: '_OrderPaymentController.items');

  @override
  List<PaymentTypeModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<PaymentTypeModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$postsListFutureAtom =
      Atom(name: '_OrderPaymentController.postsListFuture');

  @override
  ObservableFuture<List<PaymentTypeModel>> get postsListFuture {
    _$postsListFutureAtom.reportRead();
    return super.postsListFuture;
  }

  @override
  set postsListFuture(ObservableFuture<List<PaymentTypeModel>> value) {
    _$postsListFutureAtom.reportWrite(value, super.postsListFuture, () {
      super.postsListFuture = value;
    });
  }

  final _$paymentTypeIdAtom =
      Atom(name: '_OrderPaymentController.paymentTypeId');

  @override
  int get paymentTypeId {
    _$paymentTypeIdAtom.reportRead();
    return super.paymentTypeId;
  }

  @override
  set paymentTypeId(int value) {
    _$paymentTypeIdAtom.reportWrite(value, super.paymentTypeId, () {
      super.paymentTypeId = value;
    });
  }

  final _$_OrderPaymentControllerActionController =
      ActionController(name: '_OrderPaymentController');

  @override
  Future<dynamic> fetchPosts() {
    final _$actionInfo = _$_OrderPaymentControllerActionController.startAction(
        name: '_OrderPaymentController.fetchPosts');
    try {
      return super.fetchPosts();
    } finally {
      _$_OrderPaymentControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
postsListFuture: ${postsListFuture},
paymentTypeId: ${paymentTypeId}
    ''';
  }
}
