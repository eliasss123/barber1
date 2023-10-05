import 'package:barber_app1/controller/choose_barber_controller.dart';
import 'package:barber_app1/models/profile_model.dart';
import 'package:barber_app1/controller/profile_controller.dart';
import 'package:barber_app1/core/app_export.dart';
import 'package:barber_app1/screens/launch/sign.dart';
import 'package:barber_app1/screens/main_app/home/appointments.dart';
import 'package:barber_app1/screens/main_app/home/explore.dart';
import 'package:barber_app1/screens/main_app/profile/profile_screens/my_barber.dart';
import 'package:barber_app1/screens/main_app/profile/profile_screens/settings.dart';
import 'package:barber_app1/widgets/get_current.dart';
import 'package:barber_app1/widgets/custom_elevated_button.dart';
import 'package:barber_app1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:barber_app1/widgets/custom_bottom_bar.dart';
import 'package:barber_app1/controller/settings_controller.dart';
import 'dart:io';
import 'package:barber_app1/widgets/custom_elevated_button.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController controller =
      Get.put(ProfileController(ProfileModel().obs));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: ProfileBody(controller: controller),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        onChanged: (BottomBarEnum type) {
          Get.offNamed(getCurrentRoute(type), id: 3);
        },
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  final ProfileController controller;

  ProfileBody({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.fillWhiteA,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 20.v),
        child: Column(
          children: [
            ProfileHeader(),
            BarberImages(),
            SizedBox(height: 102.v),
            BarberSelection(controller: controller),
            SizedBox(
              height: 20,
            ),
            ExploreButton(),
            SizedBox(
              height: 20,
            ),
            SettingsButton(),
            Spacer(),
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
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

class BarberImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 59.v,
                width: 72.h,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Transform.translate(
                      offset: Platform.isIOS
                          ? Offset(-3, 0)
                          : Offset(-5, 0), // Change the values as needed
                      child: CustomImageView(
                          svgPath: ImageConstant.imgHead,
                          height: 46.adaptSize,
                          width: 46.adaptSize,
                          alignment: Alignment.bottomRight),
                    ),
                    CustomImageView(
                        svgPath: ImageConstant.imgScissorsOne,
                        height: 29.adaptSize,
                        width: 29.adaptSize,
                        alignment: Alignment.topLeft)
                  ],
                )),
            Transform.translate(
                offset: Offset(-1, 0),
                child: CustomImageView(
                    svgPath: ImageConstant.imgScissorsTwo,
                    height: 27.adaptSize,
                    width: 27.adaptSize,
                    margin: EdgeInsets.only(left: 1.h, bottom: 32.v)))
          ],
        ),
        // Third Scissor
        Transform.translate(
          offset: Offset(-1, 2),
          child: CustomImageView(
              svgPath: ImageConstant.imgScissorsPrimary38x38,
              alignment: Alignment.topCenter,
              height: 38.adaptSize,
              width: 38.adaptSize),
        ),
      ],
    );
  }
}

class BarberSelection extends StatelessWidget {
  final ProfileController controller;

  BarberSelection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.put(ChooseBarberController());
        // Get.to(() => MyBarber(), transition: Transition.noTransition);
        Get.to(() => MyBarber());
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent, // Makes the button transparent
        shadowColor: Colors.transparent, // Removes the shadow
        padding: EdgeInsets.zero, // Removes default padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder14,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 21.v,
        ),
        decoration: AppDecoration.fillGrayC.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder14,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 4.h,
                top: 2.v,
              ),
              child: Text(
                "lbl_my_barber".tr,
                style: CustomTextStyles.titleMediumMedium,
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                top: 6.v,
                bottom: 2.v,
              ),
              child: Transform.translate(
                offset: Offset(0, -2),
                child: Text(
                  "msg_jeno_s_barbershop".tr,
                  style: CustomTextStyles.bodySmallMontserratPrimaryContainer,
                ),
              ),
            ),
            CustomImageView(
              svgPath: ImageConstant.imgVector,
              // height: 11.v,
              // width: 5.h,
              margin: EdgeInsets.only(
                left: 6.h,
                top: 7.v,
                bottom: 4.v,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Get.offAll(() => Sign(), transition: Transition.noTransition),
      child: Text("lbl_log_out".tr, style: theme.textTheme.titleMedium),
    );
  }
}

class CustomRowButton extends StatelessWidget {
  final VoidCallback onTap;
  final double height;
  final Widget child;
  final ButtonStyle? buttonStyle;

  CustomRowButton({
    required this.onTap,
    required this.height,
    required this.child,
    this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: buttonStyle,
      child: Container(
        height: height,
        width: double.infinity,
        child: child,
      ),
    );
  }
}

class ExploreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Get.offAll(() => ExplorePage(), transition: Transition.noTransition);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent, // Makes the button transparent
          shadowColor: Colors.transparent, // Removes the shadow
          padding: EdgeInsets.zero, // Removes default padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusStyle.roundedBorder14,
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 21.v,
          ),
          decoration: AppDecoration.fillGrayC.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder14,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 4.h,
                  top: 2.v,
                ),
                child: Text(
                  "lbl_explore".tr,
                  style: CustomTextStyles.titleMediumMedium,
                ),
              ),
              Spacer(),
              CustomImageView(
                svgPath: ImageConstant.imgVector,
                // height: 11.v,
                // width: 5.h,
                margin: EdgeInsets.only(
                  left: 6.h,
                  top: 7.v,
                  bottom: 4.v,
                ),
              ),
            ],
          ),
        ));
  }
}

class SettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.put(SettingsScreenController());
        // Get.to(() => SettingsScreen(), transition: Transition.noTransition);
        Get.to(() => SettingsScreen());
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent, // Makes the button transparent
        shadowColor: Colors.transparent, // Removes the shadow
        padding: EdgeInsets.zero, // Removes default padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder14,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 21.v,
        ),
        decoration: AppDecoration.fillGrayC.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder14,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 4.h,
                top: 2.v,
              ),
              child: Text(
                "lbl_settings".tr,
                style: CustomTextStyles.titleMediumMedium,
              ),
            ),
            Spacer(),
            CustomImageView(
              svgPath: ImageConstant.imgVector,
              // height: 11.v,
              // width: 5.h,
              margin: EdgeInsets.only(
                left: 6.h,
                top: 7.v,
                bottom: 4.v,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///Handling route based on bottom click actions
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
