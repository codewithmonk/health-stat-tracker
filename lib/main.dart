import 'package:flutter/material.dart';
import './widgets/homepage.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Am I healthy",
      theme: ThemeData.dark(),
      home: SafeArea(
        child: HomePage()
      ),
    );
  }
}

void main() => runApp(MyApp());