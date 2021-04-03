import 'package:body_fat_tracker/widgets/line_chart.dart';
import 'package:flutter/material.dart';


class BodyFatLanding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red,
                    width: 5.0
                  ),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Center(child: LineChartSample1("Body Fat")
                ),
              ),
              Card(
                elevation: 10,
                color: Colors.transparent,
                shadowColor: Colors.transparent,
                child: Center(
                  child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16
                    ),
                  ),
                ),
              ),
              Row(
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
                            onPressed: () => {},
                            child: FittedBox(
                              child: Text(
                                "Add",
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 18
                                ),
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
                            onPressed: () => {},
                            child: FittedBox(
                              child: Text(
                                "History",
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
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}

