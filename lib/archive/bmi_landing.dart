import 'package:body_fat_tracker/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:body_fat_tracker/models/bmi.dart';
import 'package:body_fat_tracker/widgets/buttons.dart';
import 'package:body_fat_tracker/archive/line_chart.dart';


class BMILanding extends StatefulWidget {
  @override
  _BMILandingState createState() => _BMILandingState();
}

class _BMILandingState extends State<BMILanding> {
  @override
  List<BMI> bmi_points = [];

  final heightController = TextEditingController();

  final weightController = TextEditingController();

  final poundController = TextEditingController();

  final inchController = TextEditingController();

  final footController = TextEditingController();

  double bmi = 0.0;

  void getBMI(double height, double weight){
    User user = new User("Akash", 26, 160, 61);
    BMI bmi_obj = BMI.metric(user, 160.0, 61.0);
    setState(() {
      bmi = bmi_obj.calculateBMI();
      print(bmi);
    });
  }

  void findBMI(BuildContext context){
    showModalBottomSheet(context: context, builder: (BuildContext ctx){
      return GestureDetector(
        onTap: () => {},
        behavior: HitTestBehavior.opaque,
        child: Container(
          child: Column(
            children: <Widget> [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget> [
                  Expanded(
                    child: Text("Weight"),
                  ),
                  Expanded(
                    child: TextField(
                      controller: weightController,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget> [
                  Expanded(
                    child: Text("Height"),
                  ),
                  Expanded(
                    child: TextField(
                      controller: heightController,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                ],
              ),
              TextButton(onPressed: () => {getBMI(double.parse(heightController.text), double.parse(weightController.text))}, child: Text("Calculate BMI")),
              bmi == 0.0 ? SizedBox() : Text("BMI is ${bmi}"),
            ],
          ),
        ),
      );
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 250,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.red,
                        width: 2.0
                    ),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                    child: LineChartSample1("BMI")
                ),
              ),
              Card(
                elevation: 10,
                color: Colors.black,
                child: Center(
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16
                    ),
                  ),
                ),
              ),
              Row(
                  children: <Widget>[
                    ButtonWidget("Calculate", ()=> {
                      findBMI(context),
                    }),
                    ButtonWidget("History", ()=>{}),
                  ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

