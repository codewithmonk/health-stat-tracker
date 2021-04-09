import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ButtonWidget extends StatelessWidget {
  String buttonLabel;
  Function buttonFunction;
  ButtonWidget(this.buttonLabel, this.buttonFunction);
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? Expanded(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoButton(
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
          )
      ),
    ) : Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.width * .1,
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
        ),
      ),
    );
  }
}