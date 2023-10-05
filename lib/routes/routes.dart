import 'package:barber_app1/screens/auth/sign_up/signup_with_phone/choose_barber.dart';
import 'package:barber_app1/screens/auth/sign_up/signup_with_phone/verify_otp.dart';
import 'package:barber_app1/screens/main_app/home/appointments.dart';
import 'package:barber_app1/screens/main_app/home/explore.dart';
import 'package:barber_app1/screens/main_app/home/your_barber_profile.dart';
import 'package:barber_app1/screens/main_app/profile/profile_screens/profile.dart';
import 'package:barber_app1/screens/main_app/profile/profile_screens/settings.dart';
import 'package:get/get.dart';
import 'package:barber_app1/screens/launch/sign.dart';



class AppRoutes {
  static final List<GetPage> pages = [
    // GetPage(
    //   name: AppLinks.splashScreen,
    //   page: () => SplashScreen(),
    // ),
    GetPage(
      name: AppLinks.sign,
      page: () => Sign(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppLinks.verifyOtp,
      page: () => VerifyOtp(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppLinks.chooseBarber,
      page: () => ChooseBarber(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppLinks.yourBarberProfile,
      page: () => YourBarberProfile(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppLinks.appointments,
      page: () => AppointmentsPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppLinks.explore,
      page: () => ExplorePage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppLinks.profile,
      page: () => ProfilePage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppLinks.settings,
      page: () => SettingsScreen(),
      transition: Transition.noTransition,
    ),
  ];
}



class AppLinks {
static const bottomNavBar = '/bottom_nav_bar';
  static const home = '/home';
  static const sign = '/sign';
  static const verifyOtp = '/verify_otp';
  static const chooseBarber = '/choose_barber';
  static const yourBarberProfile = '/your_Barber_Profile';
  static const explore = '/explore';
  static const appointments = '/appointments';
  static const profile = '/profile';
  static const settings = '/settings';
  static const editPaymentMethodDetails = '/edit_payment_method_details';
  static const selectedPaymentMethodDetails =
      '/selected_payment_method_details';
  static const recentOrders = '/recent_orders';
  static const orderDetails = '/order_details';
  static const notifications = '/notifications';
  static const promotions = '/promotions';
  static const deliveryOrderStatus = '/delivery_order_status';
  static const pickUpOrderStatus = '/pick_up_order_status';
  static const support = '/support';
}