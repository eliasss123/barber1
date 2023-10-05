// import 'package:flutter/material.dart';
// import 'package:barber_app1/widgets/custom_bottom_bar.dart';
// import 'package:barber_app1/routes/routes.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// class UserChoiceHelper {
//   static const String _userChoiceKey = 'userChoice';

//   static Future<void> setUserChoice(bool choseBarber) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(_userChoiceKey, choseBarber);
//   }

//   static Future<bool?> getUserChoice() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(_userChoiceKey);
//   }
// }
