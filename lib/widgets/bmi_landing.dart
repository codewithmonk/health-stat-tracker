import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './round_edge_container.dart';
import './custom_buttons.dart';
import './bmi_calculator.dart';

class BMILanding extends StatefulWidget {
  @override
  _BMILandingState createState() => _BMILandingState();
}

class _BMILandingState extends State<BMILanding> {
  @override
  Widget build(BuildContext context) {
    Widget pageBody = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RoundEdgeContainer(Text("Hi")),
          Text(
            "This is a junk text to show default",
            style: TextStyle(color: Colors.red, fontSize: 20),
          ),
          Row(
            children: <Widget> [
              ButtonWidget("Calculate", () => {
                Navigator.push(context, MaterialPageRoute(builder: (_) => BMICalculator()))
              }),
              ButtonWidget("History", ()=>{}),
            ],
          )
        ],
      ),
    );
    return SafeArea(child: Platform.isIOS ? CupertinoPageScaffold(child: pageBody)
    : Scaffold(body: pageBody,));
  }
}

