import 'package:auto_size_text/auto_size_text.dart';
import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:delivery/app_routes.dart';
import 'package:delivery/component/components.dart';
import 'package:delivery/controller/customer_controller.dart';
import 'package:delivery/controller/order_controller.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class OrderConclude extends StatefulWidget {
  @override
  _OrderConcludeState createState() => _OrderConcludeState();
}

class _OrderConcludeState extends State<OrderConclude> {
  var _nameController = TextEditingController();
  var _docfiscalController = TextEditingController();

  final _form = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.clear();
    _docfiscalController.clear();
  }

  @override
  void initState() {
    final customer = GetIt.I.get<CustomerController>();
    super.initState();
    _nameController.text = customer.customer.name;
    _docfiscalController.text = customer.customer.docFiscal;
  }

  Future<void> _saveForm() async {
    var isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    final order = GetIt.I.get<OrderController>();

    Navigator.pushNamed(context, AppRoutes.ORDERCLOSURE,
        arguments: order.order);
  }

  @override
  Widget build(BuildContext context) {
    final customer = GetIt.I.get<CustomerController>();
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Concluir Pedido",
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
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Nome Completo'),
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => customer.customer.name = value,
                  validator: (value) {
                    bool isEmpty = value.trim().isEmpty;
                    if (isEmpty) {
                      return 'Informe seu Nome Completo!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  controller: _docfiscalController,
                  decoration: InputDecoration(
                    labelText: 'C.P.F./CNPJ - (Caso queira C.P.F na Nota)',
                  ),
                  onSaved: (value) => customer.customer.docFiscal = value,
                  validator: (value) {
                    bool isEmpty = value.trim().isEmpty;
                    if (!isEmpty) {
                      if (value.trim().length > 11) {
                        if (!CNPJ.isValid(value)) {
                          return "Este CNPJ é inválido.";
                        }
                      } else {
                        if (!CPF.isValid(value)) {
                          return "Este CPF é inválido.";
                        }
                      }
                    }
                    return null;
                  },
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
                        new AutoSizeText(
                          "Finalizar e Enviar",
                          minFontSize: 8,
                          maxFontSize: 20,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
