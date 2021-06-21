import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/controller/piz_main_controller.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PizNoteMain extends StatefulWidget {
  @override
  _PizNoteMainState createState() => _PizNoteMainState();
}

class _PizNoteMainState extends State<PizNoteMain> {
  final pizMainController = GetIt.I.get<PizMainController>();
  TextEditingController _noteController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _noteController.clear();
  }

  @override
  void initState() {
    super.initState();
    _noteController.text = pizMainController.item.note;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Observações",
          minFontSize: 8,
          maxFontSize: 20,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () {
              pizMainController.item.note = _noteController.text;
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: _buildNoteField(),
    );
  }

  Widget _buildNoteField() {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextField(
          controller: _noteController,
          enabled: true,
          autofocus: false,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          maxLength: 255,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
              ),
            ),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
