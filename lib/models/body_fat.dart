import 'package:body_fat_tracker/models/user.dart';
import 'package:flutter/cupertino.dart';

class BodyFat{
  double age;
  User user;
  double kg = 0.0;
  double cm = 0.0;
  double neck_cm = 0.0;
  double waist_cm = 0.0;
  double pounds = 0.0;
  double feet = 0.0;
  double inches = 0.0;
  double neck_inches = 0.0;
  double waist_inches = 0.0;
  String gender;

  BodyFat.imperial(
        {
          @required this.user,
          @required this.age,
          @required this.gender,
          @required this.pounds,
          @required this.feet,
          @required this.inches,
          @required this.neck_inches,
          @required this.waist_inches,
        }
      );
  BodyFat.metric(
      {
          @required this.user,
          @required this.age,
          @required this.gender,
          @required this.kg,
          @required this.cm,
          @required this.neck_cm,
          @required this.waist_cm,
        }
      );

}