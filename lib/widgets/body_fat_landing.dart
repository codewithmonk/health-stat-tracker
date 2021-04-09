import 'dart:io';
import 'package:body_fat_tracker/widgets/body_fat_calculator.dart';
import 'package:body_fat_tracker/widgets/buttons.dart';
import 'package:body_fat_tracker/widgets/round_edge_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class BodyFatLanding extends StatefulWidget {
  @override
  _BodyFatLandingState createState() => _BodyFatLandingState();
}

class _BodyFatLandingState extends State<BodyFatLanding> {

  @override
  Widget build(BuildContext context) {
    Widget pageBody = Center(
      child: Column(
        children: <Widget>[
          RoundEdgeContainer(Text("Hi")),
          Text("This is for testing"),
          Row(
            children: <Widget>[
              Expanded(
                child: ButtonWidget("Calculate", (){
                  Navigator.push(
                      context,
                      Platform.isIOS? CupertinoPageRoute(builder: (_) => BodyFatCalculator()) :
                      MaterialPageRoute(builder: (_) => BodyFatCalculator()));
                }),
              )
            ],
          )
        ],
      ),
    );
    return SafeArea(child: Platform.isIOS ? CupertinoPageScaffold(child: pageBody) : Scaffold(body: pageBody,));
  }
}

