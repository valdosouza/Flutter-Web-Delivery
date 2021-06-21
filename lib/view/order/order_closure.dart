import 'package:delivery/controller/cal_main_controller.dart';
import 'package:delivery/controller/customer_controller.dart';
import 'package:delivery/controller/institution_controller.dart';
import 'package:delivery/controller/order_controller.dart';
import 'package:delivery/controller/piz_main_controller.dart';
import 'package:delivery/model/order_model.dart';

import 'package:delivery/view/order/order_finished.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

// ignore: must_be_immutable
class OrderClosure extends StatelessWidget {
  final ordercontroller = GetIt.I.get<OrderController>();
  final pizMaincontroller = GetIt.I.get<PizMainController>();
  final calMaincontroller = GetIt.I.get<CalMainController>();
  OrderModel delivery = OrderModel();
  Widget widtget;
  @override
  Widget build(BuildContext context) {
    delivery = ModalRoute.of(context).settings.arguments;
    final institutionController = GetIt.I.get<InstitutionController>();
    final customerController = GetIt.I.get<CustomerController>();
    delivery.setInstitutionID(institutionController.institution.id);
    delivery.setCustomer(customerController.customer);
    ordercontroller.saveOrder(delivery);
    final future = ordercontroller.resutadoSendOrder;
    pizMaincontroller.clear();
    calMaincontroller.clear();
    ordercontroller.clear();
    return Observer(
      builder: (_) {
        switch (future.status) {
          case FutureStatus.pending:
            return Center(
              child: CircularProgressIndicator(),
            );

          case FutureStatus.rejected:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Falha ao enviar pedido.${future.status}"',
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: const Text('Tente Novamente'),
                    onPressed: _refresh,
                  )
                ],
              ),
            );

          case FutureStatus.fulfilled:
            return RefreshIndicator(
              onRefresh: _refresh,
              child: OrderFinished(),
            );
            break;
        }
        return widtget;
      },
    );
  }

  Future _refresh() => ordercontroller.sendOrder(delivery);
}
