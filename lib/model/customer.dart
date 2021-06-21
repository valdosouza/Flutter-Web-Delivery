import 'package:mobx/mobx.dart';
part 'customer.g.dart';

class Customer = _Customer with _$Customer;

abstract class _Customer with Store {
  @observable
  int id = 0;
  @observable
  String phone = '';
  @observable
  String name = '';
  @observable
  String docFiscal = '';
  @observable
  String zipCode = '';
  @observable
  String street = '';
  @observable
  String number = '';
  @observable
  String neighborhood = '';
  @observable
  String complement = '';
  @observable
  String locality;
  @observable
  String state;
  String unit;
  String ibge;
  @observable
  String gia;
  @observable
  String longitude = '';
  String latitude = '';
  double deliveryValue = 0.0;

  _Customer({
    this.id,
    this.phone,
    this.name,
    this.docFiscal,
    this.zipCode,
    this.street,
    this.number,
    this.neighborhood,
    this.complement,
    this.locality,
    this.state,
    this.longitude,
    this.latitude,
  });

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'name': name,
        'phone': phone,
        'docFiscal': docFiscal,
        'zipCode': zipCode,
        'street': street,
        'number': number,
        'neighborhood': neighborhood,
        'complement': complement,
        'locality': locality,
        'state': state,
        'longitude': longitude,
        'latitude': latitude
      };
}
