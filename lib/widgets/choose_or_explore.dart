// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:get/get.dart';
// import 'package:barber_app1/screens/main_app/home/explore.dart';
// import 'package:barber_app1/screens/main_app/home/your_barber_profile.dart';
// import 'package:barber_app1/screens/auth/sign_up/signup_with_phone/choose_barber.dart';

// class ChooseOrExploreWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ElevatedButton(
//           onPressed: () async {
//             SharedPreferences prefs = await SharedPreferences.getInstance();
//             await prefs.setBool('explored', false); // User chose a barber
//             Get.offAll(() => YourBarberProfile(), transition: Transition.noTransition);
//           },
//           child: Text("Choose Your Barber"),
//         ),
//         ElevatedButton(
//           onPressed: () async {
//             SharedPreferences prefs = await SharedPreferences.getInstance();
//             await prefs.setBool('explored', true); // User chose to explore
//             Get.offAll(() => ExplorePage(), transition: Transition.noTransition);
//           },
//           child: Text("Explore"),
//         ),
//       ],
//     );
//   }
// }
