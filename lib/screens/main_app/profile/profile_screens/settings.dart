import 'package:barber_app1/controller/settings_controller.dart';
import 'package:barber_app1/core/app_export.dart';
import 'package:barber_app1/screens/main_app/home/appointments.dart' hide getCurrentRoute;
import 'package:barber_app1/screens/main_app/home/explore.dart' hide getCurrentRoute;
import 'package:barber_app1/screens/main_app/profile/profile_screens/profile.dart' as profile;
import 'package:flutter/material.dart';
import 'package:barber_app1/widgets/custom_bottom_bar.dart';


class SettingsScreen extends GetWidget<SettingsScreenController> {
  SettingsScreen({Key? key}) : super(key: key);

  // Navigate to the previous screen
  void onTapArrowleftone() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight), // Default AppBar height
    child: Transform.translate(
      offset: Offset(0, 18.0), // Adjust the values as needed
      child: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: onTapArrowleftone,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: SettingsTitle(),
        centerTitle: true,
      ),)),
      body: SafeArea(child: SettingsBody()),
      // bottomNavigationBar: CustomBottomBar(
      //   onChanged: (BottomBarEnum type) {
      //     Get.toNamed(profile.getCurrentRoute(type), id: 3);
      //   },
      // ),
    );
  }
}

class SettingsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsScreenController>();
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.fillWhiteA,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 20.v),
        child: Column(
          children: [
            SizedBox(height: 58),
            DetailContainer(
              label: "lbl_first_name2".tr,
              detail: controller.firstNameController.text.isEmpty
                  ? "lbl_elias".tr
                  : controller.firstNameController.text,
            ),
            SizedBox(height: 17.v),
            DetailContainer(
              label: "lbl_last_name2".tr,
              detail: controller.lastNameController.text.isEmpty
                  ? "lbl_farah".tr
                  : controller.lastNameController.text,
            ),
            SizedBox(height: 17.v),
            DetailContainer(
              label: "lbl_phone_number".tr,
              detail: controller.phoneNumberController.text.isEmpty
                  ? "lbl_0509921871".tr
                  : controller.phoneNumberController.text,
              prefixIcon: Icons.phone,
            ),
            SizedBox(height: 34),
          ],
        ),
      ),
    );
  }
}

class SettingsTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "lbl_settings".tr,
      style: theme.textTheme.headlineLarge,
    );
  }
}

class DetailContainer extends StatelessWidget {
  final String label;
  final String detail;
  final IconData? prefixIcon;

  const DetailContainer({
    required this.label,
    required this.detail,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: CustomTextStyles.labelLargeMontserratPrimary_1),
        SizedBox(height: 1.v),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 21.v),
          decoration: BoxDecoration(
            color: appTheme.gray5004c.withOpacity(0.18),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              if (prefixIcon != null) Icon(prefixIcon, color: Colors.black),
              SizedBox(width: 8.h),
              Text(detail, style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }
}



// ///Handling route based on bottom click actions
// String getCurrentRoute(BottomBarEnum type) {
//   switch (type) {
//     case BottomBarEnum.Scissorsprimary26x26:
//       return AppLinks.yourBarberProfile;
//     case BottomBarEnum.Menu:
//       return AppLinks.appointments;
//     case BottomBarEnum.Profile:
//       return AppLinks.profile;
//     default:
//       return "/";
//   }
// }

// ///Handling page based on route
// Widget getCurrentPage(String currentRoute) {
//   switch (currentRoute) {
//     case AppLinks.explore:
//       return ExplorePage();
//     case AppLinks.appointments:
//       return AppointmentsPage();
//     case AppLinks.profile:
//       return profile.ProfilePage();
//     default:
//       return DefaultWidget();
//   }
// }


  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  // onTapArrowleftone() {
  //   Get.back();
  // }

