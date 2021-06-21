import 'package:mobx/mobx.dart';
part 'institution_model.g.dart';

class InstitutionModel = _InstitutionModel with _$InstitutionModel;

abstract class _InstitutionModel with Store {
  int id = 0;
  String name = '';
  String docFiscal = '';
  String phone = '';
  String zipCode = '';
  String address = '';
  String number = '';
  String neiborhood = '';
  String complement = '';
  String locality;
  String state;
  bool searching = false;
  String longitude = '';
  String latitude = '';
  double kmValue = 0.0;
  String urlImage = "";
  String kindCalcSize = "MA";
  String active = "S";
  String cnpj = "";
  @observable
  String logo = "";

  @computed
  get getimage {
    if (cnpj != "")
      logo =
          "https://www.gestaowebsetes.com.br/institution/" + cnpj + "/logo.jpg";
    else
      logo = "https://www.gestaowebsetes.com.br/logo_setes.png";
  }

  _InstitutionModel({
    this.id = 0,
    this.name,
    this.docFiscal = '',
    this.phone = '',
    this.zipCode,
    this.address,
    this.number,
    this.neiborhood,
    this.complement,
    this.locality,
    this.state,
    this.longitude,
    this.latitude,
    this.kmValue = 0.00,
    this.kindCalcSize,
    this.cnpj,
    this.logo,
    this.active,
  });
}
