// import 'package:barber_app1/widgets/selectday_item_widget.dart';
// import 'package:barber_app1/controller/haircut_select_controller.dart';
// import 'package:barber_app1/models/haircut_select_model.dart';
// import 'package:barber_app1/core/app_export.dart';
// import 'package:barber_app1/screens/main_app/home/explore.dart';
// import 'package:barber_app1/screens/main_app/profile/profile_screens/profile.dart';
// import 'package:barber_app1/widgets/custom_bottom_bar.dart';
// import 'package:flutter/material.dart';

// // ignore_for_file: must_be_immutable
// class HaircutScreen extends GetWidget<HaircutController> {
//   const HaircutScreen({Key? key})
//       : super(
//           key: key,
//         );

//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);

//     return SafeArea(
//       child: Scaffold(
//         body: SizedBox(
//           width: double.maxFinite,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 260.v,
//                 width: double.maxFinite,
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     CustomImageView(
//                       imagePath: ImageConstant.imgRectangle17845,
//                       height: 260.v,
//                       width: 390.h,
//                       alignment: Alignment.center,
//                     ),
//                     Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Padding(
//                         padding: EdgeInsets.only(
//                           left: 96.h,
//                           right: 96.h,
//                           bottom: 3.v,
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               "lbl_the_barbers".tr,
//                               style: theme.textTheme.headlineMedium,
//                             ),
//                             SizedBox(height: 35.v),
//                             CustomImageView(
//                               imagePath: ImageConstant.imgRectangle17844100x100,
//                               height: 100.adaptSize,
//                               width: 100.adaptSize,
//                               radius: BorderRadius.circular(
//                                 50.h,
//                               ),
//                             ),
//                             SizedBox(height: 12.v),
//                             Text(
//                               "msg_jeno_s_barbershop".tr,
//                               style: theme.textTheme.titleLarge,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "msg_george_st_tel_aviv2".tr,
//                     style: theme.textTheme.labelLarge,
//                   ),
//                   CustomImageView(
//                     svgPath: ImageConstant.imgLocation,
//                     height: 11.v,
//                     width: 7.h,
//                     margin: EdgeInsets.only(
//                       left: 3.h,
//                       bottom: 5.v,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 13.v),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CustomImageView(
//                     svgPath: ImageConstant.imgCamera,
//                     height: 28.adaptSize,
//                     width: 28.adaptSize,
//                   ),
//                   CustomImageView(
//                     imagePath: ImageConstant.imgWhatsapp,
//                     height: 28.adaptSize,
//                     width: 28.adaptSize,
//                     radius: BorderRadius.circular(
//                       5.h,
//                     ),
//                     margin: EdgeInsets.only(left: 13.h),
//                   ),
//                   CustomImageView(
//                     imagePath: ImageConstant.img2x,
//                     height: 28.adaptSize,
//                     width: 28.adaptSize,
//                     margin: EdgeInsets.only(left: 13.h),
//                   ),
//                   CustomImageView(
//                     imagePath: ImageConstant.imgImage5,
//                     height: 28.adaptSize,
//                     width: 28.adaptSize,
//                     radius: BorderRadius.circular(
//                       5.h,
//                     ),
//                     margin: EdgeInsets.only(left: 13.h),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 49.h,
//                   top: 28.v,
//                   right: 49.h,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Card(
//                       clipBehavior: Clip.antiAlias,
//                       elevation: 0,
//                       margin: EdgeInsets.all(0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadiusStyle.roundedBorder14,
//                       ),
//                       child: Container(
//                         height: 105.v,
//                         width: 132.h,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadiusStyle.roundedBorder14,
//                         ),
//                         child: Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             CustomImageView(
//                               imagePath:
//                                   ImageConstant.imgIstockphoto506514230612x612,
//                               height: 105.v,
//                               width: 132.h,
//                               radius: BorderRadius.circular(
//                                 14.h,
//                               ),
//                               alignment: Alignment.center,
//                             ),
//                             CustomImageView(
//                               svgPath: ImageConstant.imgTelevision,
//                               height: 32.v,
//                               width: 35.h,
//                               alignment: Alignment.center,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     CustomImageView(
//                       svgPath: ImageConstant.imgCar,
//                       height: 28.v,
//                       width: 33.h,
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: SizedBox(
//                   width: double.maxFinite,
//                   child: Container(
//                     margin: EdgeInsets.fromLTRB(38.h, 17.v, 38.h, 5.v),
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 20.h,
//                       vertical: 11.v,
//                     ),
//                     decoration: AppDecoration.fillPrimary.copyWith(
//                       borderRadius: BorderRadiusStyle.roundedBorder14,
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 3.h,
//                             top: 14.v,
//                             right: 14.h,
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               RichText(
//                                 text: TextSpan(
//                                   children: [
//                                     TextSpan(
//                                       text: "lbl_haircut".tr,
//                                       style: theme.textTheme.titleMedium,
//                                     ),
//                                     TextSpan(
//                                       text: "lbl_70_shekels".tr,
//                                       style:
//                                           CustomTextStyles.titleMediumPrimary_1,
//                                     ),
//                                   ],
//                                 ),
//                                 textAlign: TextAlign.left,
//                               ),
//                               CustomImageView(
//                                 svgPath: ImageConstant.imgArrowup,
//                                 height: 8.v,
//                                 width: 14.h,
//                                 margin: EdgeInsets.only(
//                                   top: 6.v,
//                                   bottom: 5.v,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Padding(
//                             padding: EdgeInsets.only(
//                               top: 25.v,
//                               right: 2.h,
//                             ),
//                             child: Obx(
//                               () => ListView.separated(
//                                 physics: NeverScrollableScrollPhysics(),
//                                 shrinkWrap: true,
//                                 separatorBuilder: (
//                                   context,
//                                   index,
//                                 ) {
//                                   return SizedBox(
//                                     height: 10.v,
//                                   );
//                                 },
//                                 itemCount: controller.haircutModelObj.value
//                                     .selectdayItemList.value.length,
//                                 itemBuilder: (context, index) {
//                                   SelectdayItemModel model = controller
//                                       .haircutModelObj
//                                       .value
//                                       .selectdayItemList
//                                       .value[index];
//                                   return SelectdayItemWidget(
//                                     model,
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: CustomBottomBar(
//           onChanged: (BottomBarEnum type) {
//             Get.toNamed(getCurrentRoute(type), id: 1);
//           },
//         ),
//       ),
//     );
//   }
// }


// ///Handling route based on bottom click actions
// String getCurrentRoute(BottomBarEnum type) {
//   switch (type) {
//     case BottomBarEnum.Scissorsprimary26x26:
//       return AppLinks
//           .yourBarberProfile; // Navigate to YourBarberProfile if the user chose their barber
//     case BottomBarEnum.Menu:
//       return AppLinks
//           .explore; // Navigate to ExplorePage if the user chose to explore
//     case BottomBarEnum.Profile:
//       return AppLinks
//           .profile; // Navigate to ProfilePage when the profile icon is clicked
//     default:
//       return "/";
//   }
// }
