import 'package:body_fat_tracker/widgets/body_fat_landing.dart';
import 'package:flutter/material.dart';

import 'package:body_fat_tracker/widgets/bmi_landing.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.red,
                              width: 2
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(60))
                      ),
                      child: TextButton(
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BMILanding())
                          )
                        },
                        child: Text(
                          "BMI",
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 18
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.red,
                              width: 2
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(60))
                      ),
                      child: TextButton(
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BodyFatLanding())
                          )
                        },
                        child: FittedBox(
                          child: Text(
                            "Body Fat",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 18
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
