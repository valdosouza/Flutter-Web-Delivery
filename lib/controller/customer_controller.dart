import 'dart:async';
import 'dart:convert';

import 'package:delivery/model/customer.dart';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

import '../constants.dart';
part 'customer_controller.g.dart';

class CustomerController = _CustomerController with _$CustomerController;

abstract class _CustomerController with Store {
  final String _baseUrl = '${Constants.BASE_API_URL}/customer/getByPhone';

  @observable
  bool searching = false;

  Customer customer = Customer(name: '');

  Future getPosts(String sPhone) async {
    final response = await http.post(
      _baseUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{'phone': sPhone},
      ),
    );
    //Registra pelo menos o telefone
    customer = Customer(
      id: 0,
      phone: sPhone,
    );
    if (response.statusCode == 200) {
      if (response.body != null) {
        if (response.body != '0') {
          final json = jsonDecode(response.body);

          customer.id = json[0]["id"];
          customer.phone = sPhone;
          customer.name = json[0]["nick_trade"];
          customer.docFiscal = json[0]["cnpj"];
          customer.zipCode = json[0]["zip_code"].toString();
          customer.street = json[0]["street"];
          customer.number = json[0]["nmbr"].toString();
          customer.neighborhood = json[0]["neighborhood"];
          customer.complement = json[0]["complement"];
          customer.locality = json[0]["locality"];
          customer.state = json[0]["state"];
          customer.longitude = json[0]["longitude"];
          customer.latitude = json[0]["latitude"];
        }
      }
    } else {
      print("Error in URL $_baseUrl");
    }
  }

  String getCompleteAddress() {
    var address = "${customer.street}, ${customer.number}";
    address += " - ${customer.neighborhood} ";
    address += ", ${customer.locality}";
    address += " - ${customer.state} ";
    address += " , ${customer.zipCode}   ";
    return address;
  }
}
