import 'package:delivery/model/group_has_optional_model.dart';
import 'package:delivery/model/menu_has_ingredient_model.dart';
import 'package:delivery/model/order_items_detail_add_model.dart';
import 'package:delivery/model/order_items_detail_model.dart';
import 'package:delivery/model/order_items_detail_rmv_model.dart';
import 'package:delivery/model/order_items_model.dart';

import 'package:mobx/mobx.dart';
part 'cal_main_controller.g.dart';

class CalMainController = _CalMainController with _$CalMainController;

abstract class _CalMainController with Store {
  OrderItemsModel item;

  clear() {
    if (item != null) {
      item.menuId = 0;
      item.description = "Calzone";
      item.parts = 1;
      item.measureId = 0;
      item.measure = "Escolha um Tamanho";
      item.partsMax = 1;
      item.qtde = 1;
      item.subTotal = 0.0;
      edgeSelected = false;
      indexFlavor = -1;
      item.subTotal = 0.0;

      for (OrderItemsDetailModel e in item.itemsDetail) {
        if (e.kind == 'Sabor') {
          e.priceTag = 0.0;
          e.description = "Escolha o Sabor";
          e.check = false;
        }
        if (e.kind == 'Borda') {
          e.priceTag = 0.0;
          e.description = "Sem Borda";
          e.check = false;
        }
        if (e.kind == 'Massa') {
          e.priceTag = 0.0;
          e.description = "Massa Tradicional";
          e.check = false;
        }
      }
    }
  }

  edititem(OrderItemsModel itemedit) {
    item = itemedit;
    item.itemsDetail = item.itemsDetail;
    indexFlavor = -1;

    setQttyflavorString();
  }

  additem() {
    item = OrderItemsModel(
      menuId: 0,
      description: "Calzone",
      parts: 1,
      measureId: 0,
      measure: "Escolha um Tamanho",
      partsMax: 1,
      qtde: 1,
      subTotal: 0.0,
      linkUrl: "https://www.gestaowebsetes.com.br/images/icon_calzone.jpg",
      itemsDetail: [
        OrderItemsDetailModel(
          id: 1,
          menuId: 0,
          description: "Escolha o Sabor",
          kind: "Sabor",
          priceTag: 0.0,
          check: false,
          ingredRemove: [
            OrderItemsDetailRmvModel(
                tbProductId: 0, description: "Não informado"),
          ].asObservable(),
          ingredOptional: [
            OrderItemsDetailAddModel(
                tbProductId: 0, description: "Não informado"),
          ].asObservable(),
        ),
        OrderItemsDetailModel(
          id: 2,
          menuId: 0,
          description: "Escolha o Sabor",
          kind: "Sabor",
          priceTag: 0.0,
          check: false,
          ingredRemove: [
            OrderItemsDetailRmvModel(
                tbProductId: 0, description: "Não informado"),
          ].asObservable(),
          ingredOptional: [
            OrderItemsDetailAddModel(
                tbProductId: 0, description: "Não informado"),
          ].asObservable(),
        ),
        OrderItemsDetailModel(
          id: 3,
          menuId: 0,
          description: "Escolha o Sabor",
          kind: "Sabor",
          priceTag: 0.0,
          check: false,
          ingredRemove: [
            OrderItemsDetailRmvModel(
                tbProductId: 0, description: "Não informado"),
          ].asObservable(),
          ingredOptional: [
            OrderItemsDetailAddModel(
                tbProductId: 0, description: "Não informado"),
          ].asObservable(),
        ),
        OrderItemsDetailModel(
          id: 4,
          menuId: 0,
          description: "Escolha o Sabor",
          kind: "Sabor",
          priceTag: 0.0,
          check: false,
          ingredRemove: [
            OrderItemsDetailRmvModel(
                tbProductId: 0, description: "Não informado"),
          ].asObservable(),
          ingredOptional: [
            OrderItemsDetailAddModel(
                tbProductId: 0, description: "Não informado"),
          ].asObservable(),
        ),
        OrderItemsDetailModel(
          id: 5,
          menuId: 0,
          description: "Sem Borda",
          kind: "Borda",
          priceTag: 0.0,
          check: true,
          ingredRemove: [
            OrderItemsDetailRmvModel(
                tbProductId: 0, description: "Não informado"),
          ].asObservable(),
          ingredOptional: [
            OrderItemsDetailAddModel(
                tbProductId: 0, description: "Não informado"),
          ].asObservable(),
        ),
        OrderItemsDetailModel(
          id: 6,
          menuId: 0,
          description: "Massa Tradicional",
          kind: "Massa",
          priceTag: 0.0,
          check: true,
          ingredRemove: [
            OrderItemsDetailRmvModel(
                tbProductId: 0, description: "Não informado"),
          ].asObservable(),
          ingredOptional: [
            OrderItemsDetailAddModel(
                tbProductId: 0, description: "Não informado"),
          ].asObservable(),
        ),
      ].asObservable(),
    );
    indexFlavor = 0;
  }

  @observable
  bool validate = true;

  @observable
  String msgvalidate = '';

  @action
  Future validateForm() async {
    validate = true;
    //Escolher Tamanho
    if (item.measure == "Escolha um Tamanho") {
      validate = false;
      msgvalidate = "Escolha um Tamanho";
    } else {
      //Escolha o Sabor
      for (OrderItemsDetailModel e in item.itemsDetail) {
        if ((e.check) && (e.description == "Escolha o Sabor")) {
          validate = false;
          msgvalidate = "Escolha o Sabor ou Retire-o da Lista";
          break;
        }
      }
    }
  }

  @action
  void addItemDetail(OrderItemsDetailModel pItemDetail) {
    bool edit = editItemDetail(pItemDetail);

    if (!edit) {
      item.itemsDetail.add(OrderItemsDetailModel(
        id: pItemDetail.id,
        menuId: pItemDetail.menuId,
        description: pItemDetail.description,
        kind: pItemDetail.kind,
        note: pItemDetail.note,
        priceTag: pItemDetail.priceTag,
        check: pItemDetail.check,
      ));
    }
  }

  bool editItemDetail(OrderItemsDetailModel pItemDetail) {
    for (OrderItemsDetailModel e in item.itemsDetail) {
      if ((e.id == pItemDetail.id) && (e.kind == pItemDetail.kind)) {
        e.id = pItemDetail.id;
        e.menuId = pItemDetail.menuId;
        e.description = pItemDetail.description;
        e.kind = pItemDetail.kind;
        e.note = pItemDetail.note;
        e.priceTag = pItemDetail.priceTag;
        e.check = pItemDetail.check;
        return true;
      }
    }
    return false;
  }

  @action
  void deleteItemDetail(OrderItemsDetailModel pItemDetail) {
    for (OrderItemsDetailModel e in item.itemsDetail) {
      if (e == pItemDetail) {
        item.itemsDetail.remove(e);
      }
    }
  }

  sumTotal() {
    item.subTotal = 0.0;
    double valueFlavor = 0;
    for (OrderItemsDetailModel e in item.itemsDetail) {
      if (e.kind == 'Sabor') {
        if (valueFlavor < e.priceTag) valueFlavor = e.priceTag;
        for (OrderItemsDetailAddModel o in e.ingredOptional) {
          if (o.check) item.subTotal = item.subTotal + o.priceTag;
        }
      } else {
        item.subTotal = item.subTotal + e.priceTag;
      }
    }
    //Soma com o maior valor do saber
    item.subTotal = item.subTotal + valueFlavor;
  }

  resetSize() {
    item.subTotal = 0.0;
    double valueFlavor = 0;
    for (OrderItemsDetailModel e in item.itemsDetail) {
      if (e.kind == 'Sabor') {
        e.priceTag = 0.0;
        e.description = "Escolha o Sabor";
        e.check = (e.id == 1);
      } else {
        item.subTotal = item.subTotal + e.priceTag;
      }
    }
    //Soma com o maior valor do saber
    item.subTotal = item.subTotal + valueFlavor;
  }

  @observable
  String qttyflavorString = "Escolha 1 Sabor";

  @action
  setQttyflavorString() {
    if (item.partsMax == 1) {
      qttyflavorString = "Escolha 1 Sabor";
    } else {
      qttyflavorString = "Escolha até ${item.partsMax} Sabores";
    }
    item.parts = 1;
    item.itemsDetail[item.parts - 1].check = true;
  }

  @observable
  int indexFlavor;

  @computed
  String get flavorDescription => item.itemsDetail[indexFlavor].description;

  @computed
  int get menuid => item.itemsDetail[indexFlavor].menuId;

  @observable
  bool edgeSelected = false;

  @action
  existItemDetailbyDescription(String value) {
    OrderItemsDetailModel detail = OrderItemsDetailModel();
    detail.description = 'Não encontrado';

    if (item.itemsDetail.isNotEmpty) {
      detail = item.itemsDetail.firstWhere(
          (element) => element.description.contains(value),
          orElse: () => detail);
    }

    this.edgeSelected = !(item.description == 'Não encontrado');
  }

  @action
  addParts() {
    item.parts++;
    if (item.parts > item.partsMax) {
      item.parts = item.partsMax;
    }
    if (item.parts <= item.partsMax) {
      for (OrderItemsDetailModel e in item.itemsDetail) {
        if (e.kind == 'Sabor') {
          e.check = (e.id <= item.parts);
        }
      }
    }
  }

  @action
  removeParts(int index) {
    item.itemsDetail[index].description = "Escolha o Sabor";
    item.itemsDetail[index].check = false;
    item.itemsDetail[index].ingredOptional.clear();
    item.itemsDetail[index].ingredRemove.clear();
    item.itemsDetail[index].priceTag = 0.0;

    item.parts--;
    if (item.parts < 0) {
      item.parts = 0;
    }
  }

  @action
  adjustParts() {
    /*
    var checked = -1;
    for (OrderItemsDetailModel e in item.itemsDetail) {
      if (e.kind == 'Sabor') if (e.check) checked++;
    }
    if (checked > partsMax) {
      item.itemsDetail[partsMax].check = false;
    }
    */
  }

  @action
  fiilListIngredient(ObservableFuture res) {
    if (item.itemsDetail[indexFlavor].ingredRemove.length <= 1) {
      item.itemsDetail[indexFlavor].ingredRemove.clear();
      for (MenuHasIngredientModel e in res.result) {
        item.itemsDetail[indexFlavor].ingredRemove.add(
          OrderItemsDetailRmvModel(
            tbProductId: e.tbProductId,
            description: e.description,
          ),
        );
      }
    }
  }

  @action
  fiilListOptional(ObservableFuture res) {
    if (item.itemsDetail[indexFlavor].ingredOptional.length <= 1) {
      item.itemsDetail[indexFlavor].ingredOptional.clear();
      for (GroupHasOptionalModel e in res.result) {
        item.itemsDetail[indexFlavor].ingredOptional.add(
          OrderItemsDetailAddModel(
            tbProductId: e.tbProductId,
            description: e.description,
            priceTag: e.priceTag,
          ),
        );
      }
    }
  }
}
