import 'package:barber_app1/controller/your_barber_controller.dart';
import 'package:barber_app1/core/app_export.dart';
import 'package:barber_app1/screens/main_app/home/appointments.dart';
import 'package:barber_app1/screens/main_app/profile/profile_screens/profile.dart';
import 'package:barber_app1/widgets/custom_bottom_bar.dart';
// import 'package:barber_app1/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:barber_app1/widgets/screen_nine.dart';
// import 'package:barber_app1/widgets/select_day.dart';
import 'package:barber_app1/widgets/Day_selection_inside.dart';
import 'package:barber_app1/widgets/time_selection_inside.dart';
// import 'package:barber_app1/widgets/haircut_select.dart';
// import 'package:barber_app1/models/your_barber_model.dart';
import 'dart:ui';
import 'dart:io';

class YourBarberProfile extends StatefulWidget {
  @override
  _YourBarberProfileState createState() => _YourBarberProfileState();
}

class _YourBarberProfileState extends State<YourBarberProfile> {
  late YourBarberController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(YourBarberController());
    // Get.put(YourBarberController()); // Initialize HaircutController here
  }

  @override
  Widget build(BuildContext context) {
    // final mediaQueryData = MediaQuery.of(context);

    return Scaffold(
        body: SafeArea(
            child: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          // _BarberTitle()
          child: Stack(
            children: [
              // _HeaderImage(),
              // _CoverImage(), // This will be behind everything
              SafeArea(
                child: Column(
                  children: [
                    _HeaderImage(), // This contains the profile image and name
                  ],
                ),
              ),
              Positioned(
                top: 313,
                bottom: 0,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: Container(
                    height: Get.height,
                    width: Get.width,
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _CardRow(),
                          _DropDownSelection(
                            controller: controller,
                            title: "lbl_haircut".tr,
                            price: "lbl_70_shekels".tr,
                            dropdownType: "haircut",
                          ),
                          _DropDownSelection(
                            controller: controller,
                            title: "lbl_beard".tr,
                            price: "lbl_30_shekels".tr,
                            dropdownType: "beard",
                          ),
                          //       _DropDownSelection(
                          //         controller: controller,
                          //         title: "goo",
                          //         price: "lbl_30_shekels".tr,
                          //         dropdownType: "beard",
                          //       ),
                          // _DropDownSelection(
                          //         controller: controller,
                          //         title: "goo",
                          //         price: "lbl_30_shekels".tr,
                          //         dropdownType: "beard",
                          //       ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
        // bottomNavigationBar: CustomBottomBar(),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            Get.offNamed(getCurrentRoute(type), id: 1);
          },
        )
        );
  }
}

class _HeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 324.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _CoverImage(),
          Positioned(
            // Use Positioned to place the title at the top
            top: 0, // Adjust this value to position it as you like
            left: 0,
            right: 0,
            child:
                Center(child: _BarberTitle()), // Center the title horizontally
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: 96.h,
                right: 96.h,
                bottom: 3.v,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // _BarberTitle(),
                  SizedBox(height: 35.v),
                  _BarberProfile(),
                  _AddressRow(),
                  SizedBox(height: 12.v),
                  _SocialMediaIcons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CoverImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//     List<Color> gradientColors;
//     List<double> gradientStops;

// // if (Platform.isIOS) {
// //   gradientColors = [Color.fromARGB(8, 114, 114, 114), Colors.white]; // Replace with your iOS colors
// // } else {
// //   gradientColors = [Colors.green, Colors.yellow]; // Replace with your Android colors
// // }

    return Transform.translate(
      offset: Offset(0, -80),
      child: Stack(children: [
        CustomImageView(
          imagePath: ImageConstant.imgRectangle17845,
          height: Get.height,
          width: Get.width,
          // padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          // height: 260.v,
          // width: 390.h,
          alignment: Alignment.center,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: Platform.isIOS
                      ? [/* iOS stops */ 0.72, 0.98]
                      : [/* Android stops */ 0.7, 1.05],
                  // stops: [0.72, 0.98],
                  colors: [
                    Color.fromARGB(8, 114, 114, 114),
                    Colors.white,
                  ]),
            ),
          ),
        ),
      ]),
      // ],
    );
    // );
  }
}

class _BarberTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "lbl_the_barbers".tr,
      style: theme.textTheme.headlineLarge,
    );
  }
}

class _BarberProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Platform.isAndroid
          ? Offset(0, -12.v)
          : Offset(0, 0), // Adjust the vertical offset for Android
      child: Column(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle17844100x100,
            height: 100.adaptSize,
            width: 100.adaptSize,
            radius: BorderRadius.circular(
              50.h,
            ),
          ),
          SizedBox(height: 12.v),
          Text(
            "msg_jeno_s_barbershop".tr,
            style: theme.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}

class _SocialMediaIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Platform.isAndroid
          ? Offset(-6, -14.v)
          : Offset(-6, 0), // Adjust the vertical offset for Android

      // offset: Offset(-6, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            svgPath: ImageConstant.imgCamera,
            height: 48.adaptSize,
            width: 48.adaptSize,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgWhatsapp,
            height: 28.adaptSize,
            width: 28.adaptSize,
            radius: BorderRadius.circular(
              5.h,
            ),
            margin: EdgeInsets.only(left: 6.h),
          ),
          CustomImageView(
            imagePath: ImageConstant.img2x,
            height: 28.adaptSize,
            width: 28.adaptSize,
            margin: EdgeInsets.only(left: 14.h),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgImage5,
            height: 28.adaptSize,
            width: 28.adaptSize,
            radius: BorderRadius.circular(
              5.h,
            ),
            margin: EdgeInsets.only(left: 14.h),
          ),
        ],
      ),
    );
  }
}

class _AddressRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Platform.isAndroid
          ? Offset(0, -6.v)
          : Offset(0, 4), // Adjust the vertical offset for Android
      // offset: Offset(0, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "msg_george_st_tel_aviv2".tr,
            style: theme.textTheme.labelLarge,
          ),
          CustomImageView(
            svgPath: ImageConstant.imgLocation,
            height: 11.v,
            width: 7.h,
            margin: EdgeInsets.only(
              left: 3.h,
              bottom: 5.v,
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-6, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            svgPath: ImageConstant.imgCamera,
            height: 48.adaptSize,
            width: 48.adaptSize,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgWhatsapp,
            height: 28.adaptSize,
            width: 28.adaptSize,
            radius: BorderRadius.circular(
              5.h,
            ),
            margin: EdgeInsets.only(left: 6.h),
          ),
          CustomImageView(
            imagePath: ImageConstant.img2x,
            height: 28.adaptSize,
            width: 28.adaptSize,
            margin: EdgeInsets.only(left: 14.h),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgImage5,
            height: 28.adaptSize,
            width: 28.adaptSize,
            radius: BorderRadius.circular(
              5.h,
            ),
            margin: EdgeInsets.only(left: 14.h),
          ),
        ],
      ),
    );
  }
}

class _CardRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
          0,
          Platform.isAndroid
              ? -38.v
              : 0), // Adjust this negative value to make it higher or lower on Android
      child: Padding(
        padding: EdgeInsets.only(
          left: 49.h,
          top: Platform.isAndroid
              ? 0.v
              : 14.v, // Adjust this negative value to make it higher or lower on Android
          right: 49.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.roundedBorder14,
              ),
              child: ElevatedButton(
                  onPressed: () => Get.offAll(() => AppointmentsPage(),
                      transition: Transition.noTransition),
                  child:
              Container(
                height: 105.v,
                width: 132.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusStyle.roundedBorder14,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgIstockphoto506514230612x612,
                      height: 105.v,
                      width: 132.h,
                      radius: BorderRadius.circular(
                        14.h,
                      ),
                      alignment: Alignment.center,
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgTelevision,
                      height: 42.v,
                      width: 35.h,
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
            ),),
            Transform.translate(
              offset: Offset(30, 0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                margin: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusStyle.roundedBorder14,
                ),
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => ProfilePage(),
                      transition: Transition.noTransition),
                  child: Container(
                    height: 105.v,
                    width: 132.h,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadiusStyle.roundedBorder14,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgCar,
                          height: 42.v,
                          width: 35.h,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DropDownSelection extends StatelessWidget {
  final YourBarberController controller;
  final String title;
  final String price;
  final String dropdownType;


  // final Rx<List<SelectionPopupModel>> items;

  _DropDownSelection({
    required this.controller,
    required this.title,
    required this.price,
    required this.dropdownType,
  });

  @override
  Widget build(BuildContext context) {
return Obx(() {
    if (controller.activeDropdown.value == "${dropdownType}_day") {
        // Return the DaySelectionWidget
        return DaySelectionWidget(controller: controller);
    } else if (controller.activeDropdown.value == "${dropdownType}_time") {
        // Return the TimeSelectionWidget
        return TimeSelectionWidget(controller: controller);
    } else if (controller.activeDropdown.value == dropdownType) {
        // Return the open state widget (ScreenNine)
        return ScreenNine(
            controller: controller,
            title: title,
            price: price,
            dropdownType: dropdownType,
        );
    } else {
        // Return the closed state widget
        return GestureDetector(
          onTap: () => controller.toggleDropDown(dropdownType),
            //         onTap: dropdownType == "haircut"
            // ? controller.toggleHaircutDropDown
            // : controller.toggleBeardDropDown,
            child: Transform.translate(
              offset: Offset(
                0,
                Platform.isAndroid ? -38.v : 0,
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(38.h, 17.v, 38.h, 0.v),
                padding: EdgeInsets.symmetric(
                  horizontal: 23.h,
                  vertical: 25.v,
                ),
                decoration: AppDecoration.fillPrimary.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder14,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    // left: 3.h,
                    right: 7.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: title, // Use the title parameter here
                              style: theme.textTheme.titleMedium,
                            ),
                            TextSpan(
                              text: price, // Use the price parameter here
                              style: CustomTextStyles.titleMediumPrimary_1,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgArrowdown,
                        height: 8.v,
                        width: 18.h,
                        margin: EdgeInsets.only(
                          top: 10.v,
                          bottom: 5.v,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      }
    });
  }
}

String getCurrentRoute(BottomBarEnum type) {
  switch (type) {
    case BottomBarEnum.Scissorsprimary26x26:
      print("Navigating to yourBarberProfile"); // Add this line for debugging
      return AppLinks.yourBarberProfile;
    case BottomBarEnum.Menu:
      return AppLinks.appointments;
    case BottomBarEnum.Profile:
      return AppLinks.profile;
    default:
      return "/";
  }
}
