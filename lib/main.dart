import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './widgets/homepage.dart';

class MyApp extends StatelessWidget{
  @override
  final String title = "Am I healthy";
  Widget build(BuildContext context){
    return Platform.isIOS? CupertinoApp(
      title: title,
      home: SafeArea(
        child: HomePage(),
      ),
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: CupertinoColors.systemOrange,
      )
    ) :MaterialApp(
      title: title,
      theme: ThemeData.dark(),
      home: SafeArea(
        child: HomePage()
      ),
    );
  }
}

void main() => runApp(MyApp());