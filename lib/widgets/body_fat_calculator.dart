import 'dart:io';

import 'package:body_fat_tracker/widgets/buttons.dart';
import 'package:body_fat_tracker/widgets/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyFatCalculator extends StatefulWidget {
  @override
  _BodyFatCalculatorState createState() => _BodyFatCalculatorState();
}

class _BodyFatCalculatorState extends State<BodyFatCalculator> {
  bool _isMetric = true;
  final _ageController = TextEditingController();
  final _weightInKgController = TextEditingController();
  final _heightInCMController = TextEditingController();
  final _neckInCMController = TextEditingController();
  final _waistInCMController = TextEditingController();
  final _weightInPoundsController = TextEditingController();
  final _heightInFeetController = TextEditingController();
  final _heightInInchesController = TextEditingController();
  final _neckInInchesController = TextEditingController();
  final _waistInInchesController = TextEditingController();
  final _hipInInchesController = TextEditingController();
  final _hipInCMController = TextEditingController();

  List <Widget> toggle_selectors = [Text("Male"), Text("Female")];
  List<bool> _selections = List.generate(2, (index) => false);
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    Widget pageBody = GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text(
                    _isMetric ? "Metric" : "Imperial",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  child: CupertinoSwitch(
                      value: _isMetric,
                      onChanged: (value) => {setState(() => _isMetric = value)},
                      activeColor: Colors.red,
                      ),
                )
              ],
            ),
            Platform.isIOS ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoSegmentedControl(
                      children: {
                        true: Container(
                          padding: EdgeInsets.all(20.0),
                          color: isMale ? Colors.orange : Colors.transparent,
                          child: Text("Male"),
                        ),
                        false: Container(
                          child: Text("Female"),
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          color: isMale ? Colors.transparent : Colors.orange,
                        )
                      },
                      onValueChanged: (value) => {setState(() => isMale = value)},
                  padding: EdgeInsets.all(10),
                  borderColor: Colors.red,
                  selectedColor: Colors.red,
                    ),
                // Text(isMale ? "Male": "Female", style: TextStyle(color: Colors.red),),
                // CupertinoSwitch(value: isMale, onChanged: (value) => {setState(() => isMale = value)}, activeColor: Colors.red,)
              ]) :ToggleButtons(
              children: toggle_selectors,
              isSelected: _selections,
              onPressed: (int index){
                setState(() {
                  if (index == 0){
                    _selections[index] = !_selections[index];
                    _selections[1] = false;
                  } else{
                    _selections[index] = !_selections[index];
                    _selections[0] = false;
                  }

                });
              },
            ),
            Expanded(
              child: Column(
                children: _isMetric ? <Widget> [
                  TextInputWidget(controller: _ageController, labelText: "Age", inputType: TextInputType.numberWithOptions(decimal: true),),
                  TextInputWidget(controller: _weightInKgController, labelText: "Weight in Kg", inputType: TextInputType.numberWithOptions(decimal: true)),
                  TextInputWidget(controller: _heightInCMController, labelText: "Height in CM", inputType: TextInputType.numberWithOptions(decimal: true)),
                  TextInputWidget(controller: _neckInCMController, labelText: "Neck circumference in CM", inputType: TextInputType.numberWithOptions(decimal: true)),
                  TextInputWidget(controller: _waistInCMController, labelText: "Waist circumference in CM", inputType: TextInputType.numberWithOptions(decimal: true)),
                  isMale ? SizedBox() :  TextInputWidget(controller: _hipInCMController, labelText: "Hip circumference in CM", inputType: TextInputType.numberWithOptions(decimal: true)),
                ] : <Widget> [
                  TextInputWidget(controller: _ageController, labelText: "Age", inputType: TextInputType.numberWithOptions(decimal: true),),
                  TextInputWidget(controller: _weightInPoundsController, labelText: "Weight in Pounds", inputType: TextInputType.numberWithOptions(decimal: true)),
                  TextInputWidget(controller: _heightInFeetController, labelText: "Height in CM", inputType: TextInputType.numberWithOptions(decimal: true)),
                  TextInputWidget(controller: _heightInInchesController, labelText: "Inches", inputType: TextInputType.numberWithOptions(decimal: true)),
                  TextInputWidget(controller: _neckInInchesController, labelText: "Neck circumference in Inches", inputType: TextInputType.numberWithOptions(decimal: true)),
                  TextInputWidget(controller: _waistInInchesController, labelText: "Waist circumference in Inches", inputType: TextInputType.numberWithOptions(decimal: true)),
                  isMale ? SizedBox() :  TextInputWidget(controller: _hipInInchesController, labelText: "Hip circumference in inches", inputType: TextInputType.numberWithOptions(decimal: true)),
                ],
              ),
            ),
            ButtonWidget("Calculate", ()=>{})
          ],
        ),
      ),
    );
    return SafeArea(child: Platform.isIOS ? CupertinoPageScaffold(child: pageBody) : Scaffold(body: pageBody,));
  }
}
