import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './round_edge_container.dart';
import './custom_buttons.dart';
import './bmi_landing.dart';
import './body_fat_landing.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void bodyFatNavigator(){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BodyFatLanding())
      );
    }
    void bmiNavigator(){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BMILanding())
      );
    }
    Widget pageBody = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget> [
          Column(
            children: <Widget> [
              RoundEdgeContainer(const Text("Hi")),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 25.0),
            child: Column(
              children: [
                Row(
                  children: <Widget> [
                    ButtonWidget("BMI", bmiNavigator),
                    ButtonWidget("Body Fat", bodyFatNavigator)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: const Text(
                      "crafted by TheMonkLabs",
                    style: TextStyle(
                      fontSize: 12
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );

    return SafeArea(
      child: Platform.isIOS
          ? CupertinoPageScaffold(
              child: pageBody
            )
          : Scaffold(
              body: pageBody,
            ),
    );
  }
}
