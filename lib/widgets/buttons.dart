import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ButtonWidget extends StatelessWidget {
  String buttonLabel;
  Function buttonFunction;
  ButtonWidget(this.buttonLabel, this.buttonFunction);
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? CupertinoButton(
      onPressed: this.buttonFunction,
      color: Colors.red,
      child: FittedBox(
        child: Text(
            this.buttonLabel,
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
    ) : Container(
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.red,
              width: 2
          ),
          borderRadius: BorderRadius.all(Radius.circular(60))
      ),
      child: TextButton(
        onPressed: this.buttonFunction,
        child: FittedBox(
          child: Text(
            this.buttonLabel,
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 18
            ),
          ),
        ),
      ),
    );
  }
}
