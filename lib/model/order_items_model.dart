import 'package:delivery/model/order_items_detail_model.dart';
import 'package:mobx/mobx.dart';
part 'order_items_model.g.dart';

class OrderItemsModel = _OrderItemsModel with _$OrderItemsModel;

abstract class _OrderItemsModel with Store {
  @observable
  int id;
  @observable
  int menuId;
  @observable
  String description;
  @observable
  String flavors;
  @observable
  int measureId;
  @observable
  String measure;
  @observable
  double qtde;
  @observable
  double subTotal;
  @observable
  int parts;
  @observable
  int partsMax;
  @observable
  String linkUrl = '';
  @observable
  String note = '';
  ObservableList<OrderItemsDetailModel> itemsDetail;

  _OrderItemsModel({
    this.id = 0,
    this.menuId = 0,
    this.description = 'item',
    this.flavors = '1',
    this.measureId = 0,
    this.measure = "Escolha um Tamanho",
    this.qtde = 1,
    this.subTotal = 0.0,
    this.parts = 1,
    this.partsMax = 1,
    this.itemsDetail,
    this.linkUrl = '',
    this.note = '',
  });

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'menuId': menuId.toString(),
        'description': description,
        'flavors': flavors,
        'measureId': measureId,
        'measure': measure,
        'qtde': qtde.toString(),
        'subTotal': subTotal.toString(),
        'parts': parts.toString(),
        'partsMax': partsMax.toString(),
        'note': note,
        'itemsDetail': itemsDetail == null
            ? null
            : itemsDetail.map((i) => i.toJson()).toList(),
      };

  addQtde() {
    this.qtde++;
  }

  removeQtde() {
    this.qtde--;
    if (this.qtde <= 0) {
      this.qtde = 1;
    }
  }
}
