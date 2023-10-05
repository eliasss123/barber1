import 'package:barber_app1/core/app_export.dart';
import 'package:barber_app1/screens/main_app/home/your_barber_profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // <-- ADDED
import 'package:barber_app1/screens/auth/sign_up/signup_with_phone/get_current_route.dart';
import 'package:barber_app1/widgets/get_current.dart';
import 'package:barber_app1/screens/main_app/profile/profile_screens/profile.dart';
import 'package:barber_app1/screens/main_app/home/explore.dart';
import 'package:barber_app1/screens/main_app/home/appointments.dart';
import 'dart:io';

enum BottomBarEnum {
  Scissorsprimary26x26, // index 0
  Menu, // index 1
  Profile, // index 2
}

class CustomBottomBar extends StatefulWidget {  // <-- CHANGED to StatefulWidget
  CustomBottomBar({
    Key? key,
    this.onChanged,
    // this.onRouteDetermined = _defaultOnRouteDetermined,  // <-- Set default value
  }) : super(
          key: key,
        );


  final Function(BottomBarEnum)? onChanged; //Added
//   final Function(BottomBarEnum, String) onRouteDetermined;
//   static void _defaultOnRouteDetermined(BottomBarEnum type, String route) {
//   // Default implementation (can be empty if you want)
// }



    @override
  _CustomBottomBarState createState() => _CustomBottomBarState();  // <-- ADDED
}

class _CustomBottomBarState extends State<CustomBottomBar> {  // <-- ADDED
  RxInt selectedIndex = 0.obs;

  // @override
  // void initState() {  // <-- ADDED
  //   super.initState();
  //   _getInitialIndex();
  // }

  
 _getInitialIndex() async {
    // bool? userChoice = await UserChoiceHelper.getUserChoice();
    // selectedIndex.value = userChoice != null && userChoice ? 0 : 1;
  }

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgScissorsPrimary26x26,
      activeIcon: ImageConstant.imgScissorsPrimary26x26,
      type: BottomBarEnum.Scissorsprimary26x26,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgMenu,
      activeIcon: ImageConstant.imgMenu,
      type: BottomBarEnum.Menu,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgProfile,
      activeIcon: ImageConstant.imgProfile,
      type: BottomBarEnum.Profile,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77.v,
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(209, 209, 209, 0.25),
            // color: appTheme.blueGray1003f,
            spreadRadius: 14.0,
            blurRadius: 14.0,

            blurStyle: BlurStyle.normal,
            offset: Offset(
              0,
              -10,
            ),
          ),
        ],
      ),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: Padding(
                padding: Platform.isAndroid ? EdgeInsets.only(top: 4.0) : EdgeInsets.only(top: 10.0), // Adjust padding only for Android
                // padding: EdgeInsets.only(top: 10),
                child: CustomImageView(
                  svgPath: bottomMenuList[index].icon,
                  height: 30.adaptSize,
                  width: 30.adaptSize,
                  color: appTheme.gray400,
                ),
              ),
              activeIcon: Padding(
                padding: Platform.isAndroid ? EdgeInsets.only(top: 4.0) : EdgeInsets.only(top: 10.0), // Adjust padding only for Android
                // padding: EdgeInsets.only(top: 10),
                child: CustomImageView(
                  svgPath: bottomMenuList[index].activeIcon,
                  height: 26.adaptSize,
                  width: 26.adaptSize,
                  color: theme.colorScheme.primary,
                ),
              ),
              label: '',
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            onChanged?.call(bottomMenuList[index].type);
          },
        //  onTap: (index) async {
        //     selectedIndex.value = index;
        //     String route = await getCurrentRoute(bottomMenuList[index].type);
        //     widget.onRouteDetermined(bottomMenuList[index].type, route);
        //     Get.toNamed(route, id: 1);
        //     widget.onChanged?.call(bottomMenuList[index].type);
        //   },

        ),
      ),
    );
  }
}




// enum BottomBarEnum {
//   Scissorsprimary26x26,
//   Menu,
//   Profile,
// }

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}