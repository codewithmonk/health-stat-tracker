import 'package:body_fat_tracker/widgets/line_chart.dart';
import 'package:flutter/material.dart';

class BMILanding extends StatelessWidget {
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
                    child: LineChartSample1()
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

