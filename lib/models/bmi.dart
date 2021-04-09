import 'package:body_fat_tracker/models/user.dart';



class BMI{
  User user;
  double height = 0.0, weight = 0.0;
  double foot = 0.0;
  double inches = 0.0;
  double pounds = 0.0;
  BMI.metric(this.user, this.height, this.weight);
  BMI.imperial(this.user, this.foot, this.inches, this.pounds);

  /// Calculates the BMI
  ///
  /// The isMetric parameter is used to toggle between metric and imperial values
  double calculateBMI({isMetric = true}){
    if (isMetric){
      height = height / 100;
      double bmi = weight / (height * height);
      return bmi;
    } else{
      height = foot * 0.3048 + inches * 0.0254;
      weight = 0.453592 * pounds;
      double bmi = weight / (height * height);
      print(bmi);
      return bmi;
    }
  }

  /// Saves the result to find trend and tracking
  void addBMIToTracking(){

  }

}