import 'dart:convert';
import 'package:delivery/controller/institution_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:delivery/constants.dart';

class DistanceDeliveryWeb {
  double distanceValue = 0.0;
  final String destinationAddress;
  final String originAddress;

  DistanceDeliveryWeb({
    this.originAddress,
    this.destinationAddress,
    this.distanceValue = 0.0,
  });

  final String _baseUrl = '${Constants.BASE_API_URL}/services/deliveryValue';

  Future getPosts() async {
    final institutionController = GetIt.I.get<InstitutionController>();
    final response = await http.post(
      _baseUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'tb_institution_id': "${institutionController.institution.id}",
          'origins': originAddress,
          'destinations': destinationAddress
        },
      ),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      distanceValue = double.parse(data[0]["kmValue"]);
    } else {
      print("Error in URL $_baseUrl");
    }
  }
}
