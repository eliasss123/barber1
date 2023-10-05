import 'package:barber_app1/routes/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barber_app1/widgets/get_current.dart';
import 'package:barber_app1/screens/main_app/bottom_nav_bar/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '';

import 'core/app_export.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//   ]).
//   then((value) {
//     Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
//     runApp(MyApp());
//   });
// }

void main() async {
  await initializeApp();
  runApp(MyApp());
}

// void main() async {
//   await initializeApp();

//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool chosenToExplore = prefs.getBool('chosenToExplore') ?? false;

//   runApp(MyApp(startWithExplore: chosenToExplore));
// }


Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Initialize your logger here
  Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);

  // More initialization logic can be added here if needed
}

class MyApp extends StatelessWidget {
  
  //   final bool startWithExplore;
  // MyApp({required this.startWithExplore});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      // home: MainScreen(),
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: const Locale('en', 'US'),
      title: 'barber_app1',
      // initialBinding:BindingsBuilder(() { }),
      // initialRoute: startWithExplore ? AppLinks.explore : AppLinks.chooseBarber,

      initialRoute: AppLinks.sign,
      getPages: AppRoutes.pages,
    );
  }
}
