import 'dart:async';
import 'dart:convert';

import 'package:delivery/model/institution_model.dart';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

import '../constants.dart';
part 'institution_controller.g.dart';

class InstitutionController = _InstitutionController
    with _$InstitutionController;

abstract class _InstitutionController with Store {
  final String _baseUrl = '${Constants.BASE_API_URL}/institution/getDelivery';

  InstitutionModel institution = InstitutionModel(docFiscal: '');

  @observable
  String titleApp = 'Delivery - Setes';
  Future<String> getPosts(String institutionId) async {
    final response = await http.post(
      _baseUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{'tb_institution_id': '$institutionId'},
      ),
    );

    if (response.statusCode == 200) {
      if (response.body != null) {
        final json = jsonDecode(response.body);
        institution = InstitutionModel(
          id: json[0]["id"],
          name: json[0]["nick_trade"],
          docFiscal: json[0]["cnpj"],
          phone: json[0]["phone"],
          zipCode: json[0]["zip_code"].toString(),
          address: json[0]["street"],
          number: json[0]["nmbr"].toString(),
          neiborhood: json[0]["neighborhood"],
          complement: json[0]["complement"],
          locality: json[0]["locality"],
          state: json[0]["state"],
          longitude: json[0]["longitude"],
          latitude: json[0]["latitude"],
          kmValue: double.parse(json[0]["km_value"]),
          kindCalcSize: json[0]["kind_calc_size"],
          cnpj: json[0]["cnpj"],
          active: json[0]["active"],
          logo: "https://www.gestaowebsetes.com.br/institution/" +
              json[0]["cnpj"] +
              "/logo.jpg",
        );
        titleApp = institution.name;
      }
      return "Dados Recebidos";
    } else {
      return "Error in URL $_baseUrl";
    }
  }

  String concatAddress() {
    var address = "${institution.address}, ${institution.number}";
    address += " - ${institution.neiborhood} ";
    address += ", ${institution.locality}";
    address += " - ${institution.state} ";
    address += " , ${institution.zipCode}   ";
    return address;
  }

  String getCompleteAddress() {
    var result = '';
    if (institution.address == null) {
      getPosts(institution.id.toString()).whenComplete(() {
        result = concatAddress();
      });
    } else {
      result = concatAddress();
    }
    return result;
  }
}
