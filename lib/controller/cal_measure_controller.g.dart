// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cal_measure_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalMeasureController on _CalMeasureController, Store {
  final _$postsListFutureAtom =
      Atom(name: '_CalMeasureController.postsListFuture');

  @override
  ObservableFuture<List<MeasurePartsModel>> get postsListFuture {
    _$postsListFutureAtom.reportRead();
    return super.postsListFuture;
  }

  @override
  set postsListFuture(ObservableFuture<List<MeasurePartsModel>> value) {
    _$postsListFutureAtom.reportWrite(value, super.postsListFuture, () {
      super.postsListFuture = value;
    });
  }

  final _$measureIdAtom = Atom(name: '_CalMeasureController.measureId');

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

  final _$_CalMeasureControllerActionController =
      ActionController(name: '_CalMeasureController');

  @override
  Future<dynamic> fetchPosts() {
    final _$actionInfo = _$_CalMeasureControllerActionController.startAction(
        name: '_CalMeasureController.fetchPosts');
    try {
      return super.fetchPosts();
    } finally {
      _$_CalMeasureControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
postsListFuture: ${postsListFuture},
measureId: ${measureId}
    ''';
  }
}
