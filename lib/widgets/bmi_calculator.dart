import 'dart:io';

import 'package:body_fat_tracker/models/bmi.dart';
import 'package:body_fat_tracker/models/user.dart';
import 'package:body_fat_tracker/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './text_input.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  bool isMetric = true;
  final weight_in_kg_controller = TextEditingController();
  final weight_in_pounds_controller = TextEditingController();
  final height_in_cm_controller = TextEditingController();
  final height_in_feet_controller = TextEditingController();
  final inches_controller = TextEditingController();

  void calculateBMI(
      {double cms, double feets, double pounds, double kgs, double inches}) {
    User user = User("Akash", 26, 160.0, 61.0);
    double bmi_val;
    if (isMetric) {
      BMI bmi = BMI.metric(user, cms, kgs);
      bmi_val = bmi.calculateBMI();
    } else {
      BMI bmi = BMI.imperial(user, feets, inches, pounds);
      print(bmi.foot);
      bmi_val = bmi.calculateBMI(isMetric: false);
    }
    Widget title = Text(
      "Your BMI Value is",
      style: TextStyle(color: Colors.red),
    );
    Widget content = Text(
      "$bmi_val",
      style: TextStyle(color: Colors.red),
    );
    void focusOut(context) => {Navigator.of(context).pop()};
    Platform.isIOS
        ? showCupertinoDialog(
            context: context,
            builder: (_) {
              return CupertinoAlertDialog(
                title: title,
                content: content,
                actions: [
                  CupertinoDialogAction(
                    child: Text("OK!"),
                    onPressed: () => focusOut(context),
                    textStyle: TextStyle(color: Colors.red),
                  )
                ],
              );
            })
        : showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: title,
                content: content,
                actions: [
                  TextButton(
                      onPressed: () => focusOut(context),
                      child: Text(
                        "OK!",
                        style: TextStyle(color: Colors.red),
                      ))
                ],
              );
            });
  }

  @override
  Widget build(BuildContext context) {
    Widget pageBody = GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                isMetric ? Text("Metric") : Text("Imperial"),
                CupertinoSwitch(
                  value: isMetric,
                  onChanged: (value) => {setState(() => isMetric = value)},
                  activeColor: Colors.red,
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: isMetric
                    ? <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextInputWidget(
                            controller: weight_in_kg_controller,
                            labelText: "Enter Weight in kg",
                            inputType:
                                TextInputType.numberWithOptions(decimal: true),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .05,
                        ),
                        TextInputWidget(
                          controller: height_in_cm_controller,
                          labelText: "Enter Height in cm",
                          inputType:
                              TextInputType.numberWithOptions(decimal: true),
                        ),
                      ]
                    : <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextInputWidget(
                            controller: weight_in_pounds_controller,
                            labelText: "Enter Weight in pounds",
                            inputType:
                                TextInputType.numberWithOptions(decimal: true),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: TextInputWidget(
                                controller: height_in_feet_controller,
                                labelText: "Enter Height(Feet)",
                                inputType: TextInputType.numberWithOptions(
                                    decimal: true),
                              ),
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.height * .1,
                                width: MediaQuery.of(context).size.width * .05),
                            Expanded(
                              child: TextInputWidget(
                                controller: inches_controller,
                                labelText: "(Inches)",
                                inputType: TextInputType.numberWithOptions(
                                    decimal: true),
                              ),
                            ),
                          ],
                        ),
                        // ButtonWidget("Calculate", ()=> {})
                      ],
              ),
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: ButtonWidget(
                  "Calculate",
                  () => {
                        if (isMetric)
                          {
                            calculateBMI(
                                kgs: double.parse(weight_in_kg_controller.text),
                                cms: double.parse(height_in_cm_controller.text))
                          }
                        else
                          {
                            calculateBMI(
                                pounds: double.parse(
                                    weight_in_pounds_controller.text),
                                feets: double.parse(
                                    height_in_feet_controller.text),
                                inches: double.parse(inches_controller.text))
                          }
                      }),
            )
          ],
        ),
      ),
    );
    return SafeArea(
        child: Platform.isIOS
            ? CupertinoPageScaffold(child: pageBody)
            : Scaffold(body: pageBody));
  }
}
