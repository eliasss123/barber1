// import 'package:barber_app/core/app_export.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart'; // Make sure to import GetX package
// import 'package:barber_app/view/screens/main_app/home/nav_nav.dart';
// import 'package:barber_app/controller/nav_controller.dart';

// class CustomBottomBar extends StatelessWidget {
//   CustomBottomBar({
//     Key? key,
//     this.onChanged,
//   }) : super(key: key);

//   final bottomNavController = Get.find<BottomNavController>();
//   Function(BottomBarEnum)? onChanged;

//   List<BottomMenuModel> bottomMenuList = [
//     BottomMenuModel(
//       icon: ImageConstant.imgScissorsPrimary26x26,
//       activeIcon: ImageConstant.imgScissorsPrimary26x26,
//       type: BottomBarEnum.Scissorsprimary26x26,
//     ),
//     BottomMenuModel(
//       icon: ImageConstant.imgMenu,
//       activeIcon: ImageConstant.imgMenu,
//       type: BottomBarEnum.Menu,
//     ),
//     BottomMenuModel(
//       icon: ImageConstant.imgProfile,
//       activeIcon: ImageConstant.imgProfile,
//       type: BottomBarEnum.Profile,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 77, // 77.v if you're using some kind of adaptation
//       decoration: BoxDecoration(
//         color: Colors.white, // Replace with your theme color
//         boxShadow: [
//           BoxShadow(
//             color: Color.fromRGBO(209, 209, 209, 0.25),
//             spreadRadius: 14.0,
//             blurRadius: 14.0,
//             offset: Offset(0, -10),
//           ),
//         ],
//       ),
//       child: Obx(
//         () => BottomNavigationBar(
//           backgroundColor: Colors.transparent,
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           selectedFontSize: 0,
//           elevation: 0,
//           currentIndex: bottomNavController.currentIndex.value,
//           type: BottomNavigationBarType.fixed,
//           items: List.generate(bottomMenuList.length, (index) {
//             return BottomNavigationBarItem(
//               icon: CustomImageView(
//                 svgPath: bottomMenuList[index].icon,
//                 height: 30, // 30.adaptSize if you're using adaptation
//                 width: 30, // 30.adaptSize if you're using adaptation
//                 color: Colors.grey, // Replace with your theme color
//               ),
//               activeIcon: CustomImageView(
//                 svgPath: bottomMenuList[index].activeIcon,
//                 height: 26, // 26.adaptSize if you're using adaptation
//                 width: 26, // 26.adaptSize if you're using adaptation
//                 color: Colors.blue, // Replace with your theme color
//               ),
//               label: '',
//             );
//           }),
//           onTap: (index) {
//             bottomNavController.changeIndex(index);
//             onChanged?.call(bottomMenuList[index].type);
//           },
//         ),
//       ),
//     );
//   }
// }
