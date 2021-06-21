import 'package:mobx/mobx.dart';
part 'menu_model.g.dart';

class MenuModel = _MenuModel with _$MenuModel;

abstract class _MenuModel with Store {
  int id;
  @observable
  String description = '';
  @observable
  double priceTag;
  @observable
  String measure;
  @observable
  int measureId;
  @observable
  String linkUrl = '';
  @observable
  double qtde = 0;
  @observable
  double subTotal = 0.0;

  get sumTotal => subTotal = 0.0;

  _MenuModel({
    this.id,
    this.description,
    this.priceTag,
    this.measure,
    this.linkUrl,
    this.qtde = 0,
  });

  addQtde() {
    qtde++;
  }

  removeQtde() {
    qtde--;
    if (qtde < 0) {
      qtde = 0;
    }
  }

  sumSubtotal() {
    subTotal = qtde * priceTag;
  }
}
