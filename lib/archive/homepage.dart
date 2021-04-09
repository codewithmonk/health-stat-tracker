import 'dart:io';

import 'package:body_fat_tracker/archive/body_fat_landing.dart';
import 'package:body_fat_tracker/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:body_fat_tracker/archive/bmi_landing.dart';

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
    Widget pageBody = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 300,
              height: 250,
              child: Center(child: Text("Hi")),
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.red,
                      width: 3
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(60))
              ),
            ),
            Center(
              child: Text(
                "Motivation",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ButtonWidget("BMI", bmiNavigator),
              ButtonWidget("Body Fat", bodyFatNavigator)
            ],
          ),
        )
      ],
    );
    return Platform.isIOS ? CupertinoPageScaffold(child: pageBody) :  Scaffold(body: pageBody);
  }
}
