import 'dart:convert';

import 'package:delivery/constants.dart';
import 'package:delivery/model/order_items_detail_add_model.dart';
import 'package:delivery/model/order_items_detail_model.dart';
import 'package:delivery/model/order_items_detail_rmv_model.dart';
import 'package:delivery/model/order_items_model.dart';
import 'package:delivery/model/order_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'order_controller.g.dart';

class OrderController = _OrderController with _$OrderController;

abstract class _OrderController with Store {
  OrderModel order = OrderModel();
  clear() {
    quantity = 0;
    this.order.clear();
    observableItems.clear();
  }

  @observable
  ObservableList<OrderItemsModel> observableItems = [
    OrderItemsModel(
      id: 1,
      description: 'Pizza',
      flavors: '',
      measure: '',
      qtde: 0,
      subTotal: 0.0,
      parts: 1,
      partsMax: 1,
    ),
  ].asObservable();

  getlistObservable() {
    observableItems.clear();
    for (OrderItemsModel e in order.items) {
      observableItems.add(
        OrderItemsModel(
          id: e.id,
          menuId: e.menuId,
          description: e.description,
          flavors: e.flavors,
          measure: e.measure,
          measureId: e.measureId,
          qtde: e.qtde,
          subTotal: e.subTotal,
          parts: e.parts,
          partsMax: e.partsMax,
          itemsDetail: e.itemsDetail,
          linkUrl: e.linkUrl,
          note: e.note,
        ),
      );
    }
  }

  addItem() {
    this.order.dtRecord = DateTime.now();
  }

  savePizza(OrderItemsModel item) {
    int sequence = 0;
    if (order.items.isNotEmpty) {
      //Verifica a sequencia
      for (OrderItemsModel e in order.items) {
        if (sequence < e.id) sequence = e.id;
      }
      //Verifica o menuId para adiconar na quantidade - Exceto Pizza
      if (item.itemsDetail == null) {
        for (OrderItemsModel e in order.items) {
          if (item.menuId == e.menuId) sequence = e.id;
        }
      }
    }

    if (item.id == 0) {
      item.id = sequence + 1;
      insertPizza(item);
    } else {
      for (OrderItemsModel e in order.items) {
        if (item.id == e.id) {
          e.description = item.description;
          e.flavors = '';
          for (OrderItemsDetailModel i in item.itemsDetail) {
            if ((i.check) && (i.kind == "Sabor")) {
              if (e.flavors == '')
                e.flavors = i.description;
              else
                e.flavors = e.flavors + '/' + i.description;
            }
          }
          e.menuId = item.menuId;
          e.itemsDetail = item.itemsDetail;
          e.measure = item.measure;
          e.measureId = item.measureId;
          e.parts = item.parts;
          e.partsMax = item.partsMax;
          e.qtde = item.qtde;
          e.subTotal = item.subTotal;
          e.linkUrl = item.linkUrl;
          e.note = item.note;

          break;
        }
      }
    }
  }

  insertPizza(OrderItemsModel item) {
    String _flavors = '';
    if (item.itemsDetail != null) {
      for (OrderItemsDetailModel i in item.itemsDetail) {
        if ((i.check) && (i.kind == "Sabor")) {
          if (_flavors == '')
            _flavors = i.description;
          else
            _flavors = _flavors + '/' + i.description;
        }
      }
    }

    ObservableList<OrderItemsDetailModel> lcItemsDetail = [
      OrderItemsDetailModel(),
    ].asObservable();

    lcItemsDetail.clear();
    for (OrderItemsDetailModel e in item.itemsDetail) {
      ObservableList<OrderItemsDetailRmvModel> lcIngredRemove =
          [OrderItemsDetailRmvModel()].asObservable();
      ObservableList<OrderItemsDetailAddModel> lcIngredOptional =
          [OrderItemsDetailAddModel()].asObservable();

      lcIngredRemove.clear();
      for (OrderItemsDetailRmvModel r in e.ingredRemove) {
        lcIngredRemove.add(OrderItemsDetailRmvModel(
          check: r.check,
          description: r.description,
          tbProductId: r.tbProductId,
        ));
      }
      lcIngredOptional..clear();
      for (OrderItemsDetailAddModel o in e.ingredOptional) {
        lcIngredOptional.add(OrderItemsDetailAddModel(
          check: o.check,
          description: o.description,
          tbProductId: o.tbProductId,
          priceTag: o.priceTag,
        ));
      }

      lcItemsDetail.add(OrderItemsDetailModel(
        check: e.check,
        description: e.description,
        id: e.id,
        kind: e.kind,
        menuId: e.menuId,
        note: e.note,
        priceTag: e.priceTag,
        ingredOptional: lcIngredOptional,
        ingredRemove: lcIngredRemove,
      ));
    }
    order.items.add(OrderItemsModel(
      id: item.id,
      menuId: item.menuId,
      description: item.description + ' ' + item.measure,
      flavors: _flavors,
      measure: item.measure,
      measureId: item.measureId,
      parts: item.parts,
      partsMax: item.partsMax,
      qtde: item.qtde,
      subTotal: item.subTotal,
      itemsDetail: lcItemsDetail,
      linkUrl: item.linkUrl,
      note: item.note,
    ));
  }

  Future saveBeverage(OrderItemsModel item) async {
    int sequence = 0;
    if (order.items.isNotEmpty) {
      //Verifica o menuId para adiconar na quantidade - Exceto Pizza
      for (OrderItemsModel e in order.items) {
        if (item.menuId == e.menuId) item.id = e.id;
      }

      //Verifica a sequencia
      if (item.id == 0) {
        for (OrderItemsModel e in order.items) {
          if (sequence < e.id) sequence = e.id;
        }
      }
    }

    if (item.id == 0) {
      item.id = sequence + 1;
      insertBeverage(item);
    } else {
      for (OrderItemsModel e in order.items) {
        if (item.menuId == e.menuId) {
          e.qtde = e.qtde + item.qtde;
          break;
        }
      }
    }
  }

  saveCalzone(OrderItemsModel item) {
    int sequence = 0;
    if (order.items.isNotEmpty) {
      //Verifica a sequencia
      for (OrderItemsModel e in order.items) {
        if (sequence < e.id) sequence = e.id;
      }
      //Verifica o menuId para adiconar na quantidade - Exceto Pizza/Calzone
      if (item.itemsDetail == null) {
        for (OrderItemsModel e in order.items) {
          if (item.menuId == e.menuId) sequence = e.id;
        }
      }
    }

    if (item.id == 0) {
      item.id = sequence + 1;
      insertCalzone(item);
    } else {
      for (OrderItemsModel e in order.items) {
        if (item.id == e.id) {
          e.description = item.description + ' ' + item.measure;
          e.flavors = '';
          for (OrderItemsDetailModel i in item.itemsDetail) {
            if ((i.check) && (i.kind == "Sabor")) {
              if (e.flavors == '')
                e.flavors = i.description;
              else
                e.flavors = e.flavors + '/' + i.description;
            }
          }
          e.menuId = item.menuId;
          e.itemsDetail = item.itemsDetail;
          e.measure = item.measure;
          e.parts = item.parts;
          e.partsMax = item.partsMax;
          e.qtde = item.qtde;
          e.subTotal = item.subTotal;
          e.linkUrl = item.linkUrl;
          e.note = item.note;

          break;
        }
      }
    }
  }

  insertCalzone(OrderItemsModel item) {
    String _flavors = '';
    if (item.itemsDetail != null) {
      for (OrderItemsDetailModel i in item.itemsDetail) {
        if ((i.check) && (i.kind == "Sabor")) {
          if (_flavors == '')
            _flavors = i.description;
          else
            _flavors = _flavors + '/' + i.description;
        }
      }
    }

    ObservableList<OrderItemsDetailModel> lcItemsDetail = [
      OrderItemsDetailModel(),
    ].asObservable();

    lcItemsDetail.clear();
    for (OrderItemsDetailModel e in item.itemsDetail) {
      ObservableList<OrderItemsDetailRmvModel> lcIngredRemove =
          [OrderItemsDetailRmvModel()].asObservable();
      ObservableList<OrderItemsDetailAddModel> lcIngredOptional =
          [OrderItemsDetailAddModel()].asObservable();

      lcIngredRemove.clear();
      for (OrderItemsDetailRmvModel r in e.ingredRemove) {
        lcIngredRemove.add(OrderItemsDetailRmvModel(
          check: r.check,
          description: r.description,
          tbProductId: r.tbProductId,
        ));
      }
      lcIngredOptional.clear();
      for (OrderItemsDetailAddModel o in e.ingredOptional) {
        lcIngredOptional.add(OrderItemsDetailAddModel(
          check: o.check,
          description: o.description,
          tbProductId: o.tbProductId,
          priceTag: o.priceTag,
        ));
      }

      lcItemsDetail.add(OrderItemsDetailModel(
        check: e.check,
        description: e.description,
        id: e.id,
        kind: e.kind,
        menuId: e.menuId,
        note: e.note,
        priceTag: e.priceTag,
        ingredOptional: lcIngredOptional,
        ingredRemove: lcIngredRemove,
      ));
    }
    order.items.add(OrderItemsModel(
      id: item.id,
      menuId: item.menuId,
      description: item.description + ' ' + item.measure,
      flavors: _flavors,
      measure: item.measure,
      measureId: item.measureId,
      parts: item.parts,
      partsMax: item.partsMax,
      qtde: item.qtde,
      subTotal: item.subTotal,
      itemsDetail: lcItemsDetail,
      linkUrl: item.linkUrl,
      note: item.note,
    ));
  }

  updateQtde(OrderItemsModel item) {
    for (OrderItemsModel e in order.items) {
      if (item.menuId == e.menuId) {
        e.qtde = item.qtde;
      }
    }
    qtdeShoppingCart();
    order.totalizer();
  }

  insertBeverage(OrderItemsModel item) {
    order.items.add(OrderItemsModel(
      id: item.id,
      menuId: item.menuId,
      description: item.description + ' ' + item.measure,
      flavors: '',
      measure: item.measure,
      parts: item.parts,
      partsMax: item.partsMax,
      qtde: item.qtde,
      subTotal: item.subTotal,
      linkUrl: item.linkUrl,
      note: item.note,
    ));
  }

  @observable
  bool validate = true;
  @observable
  String msgvalidate = '';

  @observable
  double quantity = 0.00;

  @action
  qtdeShoppingCart() {
    quantity = 0;
    for (OrderItemsModel e in order.items) {
      quantity = quantity + e.qtde;
    }
  }

  @action
  Future verifyItems() async {
    validate = true;

    //Escolher Forma de Pagamento
    order.totalizer();

    if (order.totalValue == 0.0) {
      validate = false;
      msgvalidate = "Não há itens no carrinho";
    }
  }

  @action
  Future validateForm() async {
    validate = true;
    //Escolher Forma de Pagamento
    if (order.paymentType == "Informar...") {
      validate = false;
      msgvalidate = "Escolha uma Forma de Pagamento";
    }
  }

  final String _baseUrl = '${Constants.BASE_API_URL}/delivery/save';

  Future _sendOrderPost(OrderModel pOrder) async {
    final contentBody = jsonEncode(<String, Map>{
      "order": pOrder.toJson(),
    });

    final response = await http.post(
      _baseUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: contentBody,
    );

    if (response.statusCode != 200) {
      print("Error in URL");
    }
  }

  @observable
  ObservableFuture<String> resutadoSendOrder;

  @action
  Future sendOrder(OrderModel pOrder) => resutadoSendOrder =
      ObservableFuture(_sendOrderPost(pOrder).then((posts) => posts));

  void saveOrder(OrderModel pOrder) {
    sendOrder(pOrder);
  }
}
