// import 'package:barber_app1/core/app_export.dart';
// import 'package:flutter/material.dart';
// import 'package:barber_app1/widgets/custom_bottom_bar.dart';
// import 'package:barber_app1/screens/main_app/profile/profile_screens/profile.dart';
// import 'package:barber_app1/screens/main_app/home/explore.dart';
// import 'package:barber_app1/screens/main_app/home/appointments.dart';
// import 'dart:io';


// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _currentIndex = 0;

//   final List<Widget> _screens = [
//     ExplorePage(),
//     AppointmentsPage(),
//     ProfilePage(),
//     // Add other screens here...
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: _currentIndex,
//         children: _screens,
//       ),
//       bottomNavigationBar: CustomBottomBar(
//         onChanged: (BottomBarEnum type) {
//           setState(() {
//             _currentIndex = type.index; // Assuming BottomBarEnum has an index
//           });
//         },
//       ),
//     );
//   }
// }
