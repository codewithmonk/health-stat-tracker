import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class TextInputWidget extends StatelessWidget {
  String labelText;
  TextInputType inputType;
  TextEditingController controller;
  TextInputWidget({@required this.controller, this.inputType, @required this.labelText});
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? inputType == null ? Container(
      height: MediaQuery.of(context).size.width * .1,
      width: MediaQuery.of(context).size.width * .4,
      child: CupertinoTextField(
        controller: this.controller,
        placeholder: this.labelText,
        decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2), borderRadius: BorderRadius.circular(10)),
      ),
    ) : Container(
      height: MediaQuery.of(context).size.width * .1,
      width: MediaQuery.of(context).size.width * .5,
      child: CupertinoTextField(
        controller: this.controller,
        placeholder: this.labelText,
        keyboardType: inputType,
        decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2),borderRadius: BorderRadius.circular(10)),
      ),
    ) : inputType == null ? TextField(
      controller: this.controller,
      decoration: InputDecoration(labelText: this.labelText),
    ) : TextField(
      controller: this.controller,
      decoration: InputDecoration(labelText: this.labelText),
      keyboardType: this.inputType,
    );
  }
}
