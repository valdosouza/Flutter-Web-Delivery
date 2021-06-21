import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/app_routes.dart';
import 'package:delivery/component/components.dart';
import 'package:delivery/controller/customer_controller.dart';
import 'package:delivery/controller/institution_controller.dart';
import 'package:delivery/controller/order_controller.dart';

import 'package:delivery/service/distance_delivery_web.dart';

import 'package:delivery/service/via_cep_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class OrderShipping extends StatefulWidget {
  @override
  _OrderShippingState createState() => _OrderShippingState();
}

class _OrderShippingState extends State<OrderShipping> {
  var _searchCepController = TextEditingController();
  var _addressController = TextEditingController();
  var _numberController = TextEditingController();
  var _neiborHoodController = TextEditingController();
  var _complementController = TextEditingController();
  final _form = GlobalKey<FormState>();

  final _number = FocusNode();
  final _neiborhood = FocusNode();
  final _complement = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _searchCepController.clear();
    _addressController.clear();
    _numberController.clear();
    _neiborHoodController.clear();
    _complementController.clear();
  }

  @override
  void initState() {
    final customer = GetIt.I.get<CustomerController>();
    super.initState();
    _searchCepController.text = customer.customer.zipCode;
    _addressController.text = customer.customer.street;
    _numberController.text = customer.customer.number;
    _neiborHoodController.text = customer.customer.neighborhood;
    _complementController.text = customer.customer.complement;
  }

  Future<void> _saveForm() async {
    var isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }

    _form.currentState.save();

    final customer = GetIt.I.get<CustomerController>();
    final institution = GetIt.I.get<InstitutionController>();
    final orderController = GetIt.I.get<OrderController>();
    DistanceDeliveryWeb distance = DistanceDeliveryWeb(
      originAddress: institution.getCompleteAddress(),
      destinationAddress: customer.getCompleteAddress(),
      distanceValue: 0.00,
    );

    distance.getPosts().whenComplete(() {
      customer.customer.deliveryValue = distance.distanceValue;
      orderController.order.deliveryValue = distance.distanceValue;

      Navigator.pushNamed(context, AppRoutes.ORDERCHECKOUT);
    });
  }

  @override
  Widget build(BuildContext context) {
    final customer = GetIt.I.get<CustomerController>();
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Endereço de Entrega",
          minFontSize: 8,
          maxFontSize: 20,
          maxLines: 1,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          shoppingCart(context),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Observer(builder: (_) {
          return Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(labelText: 'Cep'),
                  controller: _searchCepController,
                  enabled: !customer.searching,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onPressed: _searchCep,
                    child: customer.searching
                        ? _circularLoading()
                        : Text('Consultar CEP'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    controller: _addressController,
                    //initialValue: customer.address,
                    decoration: InputDecoration(labelText: 'Endereço'),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_number);
                    },
                    onSaved: (value) => customer.customer.street = value,
                    validator: (value) {
                      bool isEmpty = value.trim().isEmpty;
                      bool isInvalid = value.trim().length < 5;

                      if (isEmpty || isInvalid) {
                        return 'Informe um endereço  válido!';
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    controller: _numberController,
                    //initialValue: customer.number,
                    decoration: InputDecoration(labelText: 'Número'),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_neiborhood);
                    },
                    onSaved: (value) => customer.customer.number = value,
                    validator: (value) {
                      bool isEmpty = value.trim().isEmpty;
                      if (isEmpty) {
                        return 'Informe o número da residencia!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    controller: _neiborHoodController,
                    //initialValue: customer.neiborhood,
                    decoration: InputDecoration(labelText: 'Bairro'),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_complement);
                    },
                    onSaved: (value) => customer.customer.neighborhood = value,
                    validator: (value) {
                      bool isEmpty = value.trim().isEmpty;
                      if (isEmpty) {
                        return 'Informe o nome do bairro!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    controller: _complementController,
                    //initialValue: customer.complement,
                    decoration: InputDecoration(labelText: 'Complemento'),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_complement);
                    },
                    onSaved: (value) => customer.customer.complement = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.lightGreen),
                      ),
                    ),
                    onPressed: () {
                      _saveForm();
                    },
                    child: Container(
                      height: 50,
                      width: 300,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text('Avançar',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          new Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                            size: 40.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _circularLoading() {
    return Container(
      height: 15.0,
      width: 15.0,
      child: CircularProgressIndicator(),
    );
  }

  Future _searchCep() async {
    final customer = GetIt.I.get<CustomerController>();

    customer.searching = true;

    final cep = _searchCepController.text;

    final resultCep = await ViaCepService.fetchCep(cep: cep);

    if (resultCep != null) {
      customer.customer.street = resultCep.logradouro;
      customer.customer.neighborhood = resultCep.bairro;
      customer.customer.zipCode = resultCep.cep;
      customer.customer.gia = resultCep.gia;
      customer.customer.ibge = resultCep.ibge;
      customer.customer.locality = resultCep.localidade;
      customer.customer.state = resultCep.uf;
      customer.customer.unit = resultCep.unidade;
      //Controllers Edit;
      _searchCepController.text = resultCep.cep;
      _addressController.text = resultCep.logradouro;
      _neiborHoodController.text = resultCep.bairro;
      _number.hasFocus;
    }

    customer.searching = false;
  }
}
