import 'package:delivery/app_routes.dart';
import 'package:delivery/controller/bev_main_controller.dart';
import 'package:delivery/controller/cal_dough_controller.dart';
import 'package:delivery/controller/cal_flavor_controller.dart';
import 'package:delivery/controller/cal_ingredient_controller.dart';
import 'package:delivery/controller/cal_main_controller.dart';
import 'package:delivery/controller/cal_measure_controller.dart';
import 'package:delivery/controller/cal_optional_controller.dart';
import 'package:delivery/controller/customer_controller.dart';
import 'package:delivery/controller/institution_controller.dart';
import 'package:delivery/controller/order_payment_controller.dart';
import 'package:delivery/view/beverage/button/bev_rest_button_main.dart';
import 'package:delivery/view/beverage/items/bev_items_main.dart';

import 'package:delivery/view/beverage/subgroup/bev_rest_subgroup_main.dart';
import 'package:delivery/view/calzone/dough/cal_dough_main.dart';
import 'package:delivery/view/calzone/flavor/cal_flavor_ingredients_main.dart';
import 'package:delivery/view/calzone/flavor/cal_flavor_main.dart';
import 'package:delivery/view/calzone/ingredient/cal_ingredient_main.dart';
import 'package:delivery/view/calzone/main/cal_main.dart';
import 'package:delivery/view/calzone/meaure/cal_measure_main.dart';
import 'package:delivery/view/calzone/optional/cal_optional_main.dart';
import 'package:delivery/view/order/chekout/order_check_out.dart';
import 'package:delivery/view/order/order_closure.dart';
import 'package:delivery/view/order/items/order_item_total.dart';
import 'package:delivery/view/order/order_conclude.dart';
import 'package:delivery/view/order/order_finished.dart';
import 'package:delivery/view/order/order_kind_attendance.dart';

import 'package:delivery/view/order/order_shipping.dart';
import 'package:delivery/view/order/payment/order_payment_main.dart';
import 'package:delivery/view/pizza/dough/piz_dough_main.dart';
import 'package:delivery/view/pizza/edge/piz_edge_main.dart';

import 'package:delivery/view/pizza/flavor/piz_flavor_ingredients_main.dart';
import 'package:delivery/view/pizza/flavor/piz_flavor_main.dart';
import 'package:delivery/view/pizza/ingredient/piz_ingredient_main.dart';
import 'package:delivery/view/pizza/main/piz_main.dart';
import 'package:delivery/view/pizza/meaure/piz_measure_main.dart';

import 'package:delivery/view/pizza/note/piz_note_main.dart';
import 'package:delivery/view/pizza/optional/piz_optional_main.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:get_it/get_it.dart';
import 'routers.dart';
import 'package:delivery/controller/order_controller.dart';
import 'package:delivery/controller/piz_edge_controller.dart';
import 'package:delivery/controller/piz_flavor_controller.dart';
import 'package:delivery/controller/piz_ingredient_controller.dart';
import 'package:delivery/controller/piz_measure_controller.dart';

import 'controller/piz_dough_controller.dart';
import 'controller/piz_main_controller.dart';
import 'controller/piz_optional_controller.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<InstitutionController>(InstitutionController());
  getIt.registerSingleton<CustomerController>(CustomerController());
  getIt.registerSingleton<PizMainController>(PizMainController());
  getIt.registerSingleton<PizMeasureController>(PizMeasureController());
  getIt.registerSingleton<PizIngredientController>(PizIngredientController());
  getIt.registerSingleton<PizOptionalController>(PizOptionalController());
  getIt.registerSingleton<PizEdgeController>(PizEdgeController());
  getIt.registerSingleton<PizDoughController>(PizDoughController());
  getIt.registerSingleton<PizFlavorController>(PizFlavorController());
  getIt.registerSingleton<BevMainController>(BevMainController());
  getIt.registerSingleton<OrderController>(OrderController());
  getIt.registerSingleton<OrderPaymentController>(OrderPaymentController());
  getIt.registerSingleton<CalMainController>(CalMainController());
  getIt.registerSingleton<CalMeasureController>(CalMeasureController());
  getIt.registerSingleton<CalIngredientController>(CalIngredientController());
  getIt.registerSingleton<CalOptionalController>(CalOptionalController());
  getIt.registerSingleton<CalDoughController>(CalDoughController());
  getIt.registerSingleton<CalFlavorController>(CalFlavorController());

  runApp(DeliveryApp());
}

class DeliveryApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.onGenerateRoute,
      title: 'Delivery - Setes',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        AppRoutes.PIZZA: (ctx) => PizMain(),
        AppRoutes.PIZMEASUREMAIN: (ctx) => PizMeasureMain(),
        AppRoutes.PIZFLAVORMAIN: (ctx) => PizFlavorMain(),
        AppRoutes.PIZFLAVORINGREDIENTMAIN: (ctx) => PizFlavorIngredientsMain(),
        AppRoutes.PIZFEDGEMAIN: (ctx) => PizEdgeMain(),
        AppRoutes.PIZDOUGHMAIN: (ctx) => PizDoughMain(),
        AppRoutes.PIZNOTEMAIN: (ctx) => PizNoteMain(),
        AppRoutes.PIZINGREDIENTMAIN: (ctx) => PizIngredientMain(),
        AppRoutes.PIZOPTIONALMAIN: (ctx) => PizOptionalMain(),
        AppRoutes.BEVERAGESUBGROUP: (ctx) => BevRestSubgroupMain(),
        AppRoutes.BEVERAGEBUTTON: (ctx) => BevRestButtonMain(),
        AppRoutes.BEVERAGEITEMS: (ctx) => BevItemMain(),
        AppRoutes.ORDERSUBTOTAL: (ctx) => OrderItemTotal(),
        AppRoutes.ORDERKINDATTENDANCE: (ctx) => OrderKindAttendance(),
        AppRoutes.ORDERSHIPPING: (ctx) => OrderShipping(),
        AppRoutes.ORDERCHECKOUT: (ctx) => OrderCheckOut(),
        AppRoutes.ORDERPAYMENTMAIN: (ctx) => OrderPaymentMain(),
        AppRoutes.ORDERCONCLUDE: (ctx) => OrderConclude(),
        AppRoutes.ORDERFINISHED: (ctx) => OrderFinished(),
        AppRoutes.ORDERCLOSURE: (ctx) => OrderClosure(),
        AppRoutes.CALZONE: (ctx) => CalMain(),
        AppRoutes.CALMEASUREMAIN: (ctx) => CalMeasureMain(),
        AppRoutes.CALFLAVORMAIN: (ctx) => CalFlavorMain(),
        AppRoutes.CALFLAVORINGREDIENTMAIN: (ctx) => CalFlavorIngredientsMain(),
        AppRoutes.CALDOUGHMAIN: (ctx) => CalDoughMain(),
        AppRoutes.CALINGREDIENTMAIN: (ctx) => CalIngredientMain(),
        AppRoutes.CALOPTIONALMAIN: (ctx) => CalOptionalMain(),
      },
    );
  }
}

class Four04Page extends StatelessWidget {
  final String message;
  Four04Page(this.message);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Page Not Found')),
        body: Center(child: Text(message)),
      );
}
