import 'package:barber_app1/controller/appointments_controller.dart';
import 'package:barber_app1/models/appointments_model.dart';
import 'package:barber_app1/core/app_export.dart';
import 'package:barber_app1/screens/main_app/home/explore.dart';
import 'package:barber_app1/screens/main_app/profile/profile_screens/profile.dart';
import 'package:barber_app1/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:barber_app1/widgets/custom_bottom_bar.dart';
import 'package:barber_app1/widgets/get_current.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:barber_app1/widgets/custom_elevated_button.dart';


class AppointmentsPage extends StatelessWidget {
  AppointmentsPage({Key? key}) : super(key: key);

  final AppointmentsController controller =
      Get.put(AppointmentsController(AppointmentsModel().obs));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _BodyContent(controller: controller),
      ),
      bottomNavigationBar: CustomBottomBar(
        onChanged: (BottomBarEnum type) {
          Get.offNamed(getCurrentRoute(type), id: 2);
        },
      ),
    );
  }
}

class _BodyContent extends StatefulWidget {
  final AppointmentsController controller;

  _BodyContent({required this.controller});

  @override
  _BodyContentState createState() => _BodyContentState();
}

class _BodyContentState extends State<_BodyContent> {
  Map<String, String?> appointmentData = {};

  @override
  void initState() {
    super.initState();
    _loadAppointmentData();
  }

  Future<void> _loadAppointmentData() async {
  final prefs = await SharedPreferences.getInstance();
  final appointmentDay = prefs.getString('appointmentDay');
  final appointmentTime = prefs.getString('appointmentTime');
  setState(() {
    appointmentData = {'day': appointmentDay, 'time': appointmentTime};
  });
}


  @override
  Widget build(BuildContext context) {
    if (appointmentData['day'] == null || appointmentData['time'] == null) {
      return _NoAppointmentLayout();
    } else {
      return _AppointmentLayout(
      appointmentDay: appointmentData['day']!,
      appointmentTime: appointmentData['time']!,
      onDelete: _loadAppointmentData, // Pass the function to reload data
    );
    }
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Map<String, String?>>(
//       future: _getAppointmentData(),
//       builder: (context, snapshot) {
//         if (!widget.controller.hasAppointment.value || snapshot.connectionState == ConnectionState.waiting) {
//           // if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error loading appointment data'));
//         } else if (!snapshot.hasData ||
//             snapshot.data!['day'] == null ||
//             snapshot.data!['time'] == null) {
//           return _NoAppointmentLayout();
//         } else {
//           return _AppointmentLayout(
//             appointmentDay: snapshot.data!['day']!,
//             appointmentTime: snapshot.data!['time']!,
//           );
//         }
//       },
//     );
//   }
// }


class _NoAppointmentLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.fillWhiteA,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 20.v),
        child: Column(
          children: [
            _Header(),
            SizedBox(height: 207.v),
            _NoAppointmentsMessage(),
            Spacer(),
            SizedBox(height: 21.v),
            _HistoryButton(),
          ],
        ),
      ),
    );
  }
}

class _AppointmentLayout extends StatelessWidget {
  final String appointmentDay;
  final String appointmentTime;
    final VoidCallback onDelete; // Define the onDelete parameter


  _AppointmentLayout({
    required this.appointmentDay,
    required this.appointmentTime,
        required this.onDelete, // Make sure to include it in the constructor

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.fillWhiteA,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 20.v),
        child: Column(
          children: [
            _Header(),
            SizedBox(height: 30.v),
            _AppointmentNew(
              appointmentDay: appointmentDay,
              appointmentTime: appointmentTime,
              onDelete: onDelete,
            ),
            Spacer(),
            SizedBox(height: 21.v),
            _HistoryButton(),
          ],
        ),
      ),
    );
  }
}



class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 14.v),
        Text("lbl_the_barbers".tr, style: theme.textTheme.headlineLarge),
        SizedBox(height: 22.v),
        // BarberImages(),
      ],
    );
  }
}

class _NoAppointmentsMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "msg_you_have_no_appointments".tr,
      style: CustomTextStyles.titleSmallMontserratPrimaryMedium,
    );
  }
}

class _AppointmentNew extends StatelessWidget {
  final String appointmentDay;
  final String appointmentTime;
    final VoidCallback onDelete; // Add this line


  _AppointmentNew({
    required this.appointmentDay,
    required this.appointmentTime,
        required this.onDelete,
  });

  final AppointmentsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getAppointmentDetails(),
      builder: (context, AsyncSnapshot<Map<String, String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); // Show loading indicator while waiting
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('No appointment data available.'));
        } else {
          String appointmentDay = snapshot.data!['day'] ?? '';
          String appointmentTime = snapshot.data!['time'] ?? '';

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "msg_your_appointment".tr,
                style: CustomTextStyles.titleSmallMontserratPrimaryMedium,
              ),
              SizedBox(height: 4.v),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 103.h,
                  vertical: 19.v,
                ),
                decoration: AppDecoration.fillGray.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder14,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle1784460x60,
                      height: 60.adaptSize,
                      width: 60.adaptSize,
                      radius: BorderRadius.circular(
                        30.h,
                      ),
                    ),
                    SizedBox(height: 8.v),
                    Text(
                      "msg_jeno_s_barbershop".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                    SizedBox(height: 1.v),
                    Text(
                      "msg_george_st_tel_aviv".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                    SizedBox(height: 26.v),
                    Text(
                      '$appointmentDay',
                      style: CustomTextStyles.titleLargeMontserratPrimary,
                    ),
                    SizedBox(height: 8.v,),
                    Text(
                      // 'Time: $appointmentTime',
                      '$appointmentTime',
                      style: CustomTextStyles.titleMediumMedium19,
                    ),
                    CustomElevatedButton(
                      height: 48.v,
                      text: "lbl_cancel".tr,
                      margin: EdgeInsets.only(
                        left: 4.h,
                        top: 32.v,
                        right: 5.h,
                      ),
                      buttonStyle: CustomButtonStyles.fillBlueGray,
                      buttonTextStyle: CustomTextStyles.titleMediumDMSans,

  onTap: () async {
    await controller.deleteAppointment(); // Delete the appointment
    onDelete(); // Reload the appointment data
  },


                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Future<Map<String, String>> _getAppointmentDetails() async {
    final prefs = await SharedPreferences.getInstance();
    String appointmentDay = prefs.getString('appointmentDay') ?? '';
    String appointmentTime = prefs.getString('appointmentTime') ?? '';
    return {'day': appointmentDay, 'time': appointmentTime};
  }
}



class _HistoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
            onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProfilePage(),
          ),
        );
      },
      height: 61.v,
      text: "lbl_your_history".tr,
      rightIcon: Container(
        margin: EdgeInsets.only(left: 30.h),
        child: CustomImageView(
          svgPath: ImageConstant.imgArrowright,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlinePrimaryTL12,
      buttonTextStyle: CustomTextStyles.titleMediumMedium,
    );
  }
}


// ///Handling route based on bottom click actions
String getCurrentRoute(BottomBarEnum type) {
  switch (type) {
    case BottomBarEnum.Scissorsprimary26x26:
      return AppLinks.yourBarberProfile;
    case BottomBarEnum.Menu:
      return AppLinks.appointments;
    case BottomBarEnum.Profile:
      return AppLinks.profile;
    default:
      return "/";
  }
}

///Handling page based on route
Widget getCurrentPage(String currentRoute) {
  switch (currentRoute) {
    case AppLinks.explore:
      return ExplorePage();
    case AppLinks.appointments:
      return AppointmentsPage();
    case AppLinks.profile:
      return ProfilePage();
    default:
      return DefaultWidget();
  }
}
