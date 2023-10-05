import 'package:barber_app1/screens/main_app/home/your_barber_profile.dart';
import 'package:barber_app1/widgets/userprofile_item_widget.dart';
import 'package:barber_app1/controller/explore_controller.dart';
import 'package:barber_app1/models/explore_model.dart';
import 'package:barber_app1/models/userprofile_item_model.dart';
import 'package:barber_app1/core/app_export.dart';
import 'package:barber_app1/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
// import 'package:barber_app1/core/utils/size_utils.dart';
import 'package:barber_app1/widgets/custom_bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:barber_app1/screens/main_app/home/appointments.dart';
import 'package:barber_app1/screens/main_app/profile/profile_screens/profile.dart';
// import 'package:barber_app1/core/utils/size_utils.dart' as responsive;
// import 'package:barber_app1/core/utils/size_utils.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({Key? key}) : super(key: key);

  final ExploreController controller =
      Get.put(ExploreController(ExploreModel().obs));

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ExploreBody(controller: controller),
        ),
      ),
      // bottomNavigationBar: CustomBottomBar(),
      bottomNavigationBar: CustomBottomBar(
        onChanged: (BottomBarEnum type) {
          Get.offNamed(getCurrentRoute(type), id: 1);
          // Handle bottom bar actions
        },
      )
      );
  }
}

class ExploreBody extends StatelessWidget {
  final ExploreController controller;

  ExploreBody({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.fillWhiteA,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setHeight(31), vertical: 20.v),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildSearchBar(context),
            // SizedBox(height: 5.h),
            SizedBox(
              height: ScreenUtil().setHeight(5),
            ),
            _buildAvailableTodaySection(),
            SizedBox(
              height: ScreenUtil().setHeight(35),
            ),
            // SizedBox(height: 35.h),
            _buildNearbyBarbers(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Align(
        alignment: Alignment.center,
        child: Transform.translate(
          offset: Offset(0,
              -20), // Adjust the y-value to move the title up by desired pixels
          child: Text(
            "lbl_the_barbers".tr,
            style: theme.textTheme.headlineLarge,
          ),
        ));
  }

Widget _buildSearchBar(BuildContext context) {
  return GestureDetector(
    onTap: () {
      FocusScope.of(context).unfocus();
    },
    child: CustomSearchView(
      margin: EdgeInsets.only(
        left: ScreenUtil().setWidth(6),
        top: 43.v,
        right: ScreenUtil().setWidth(7),
      ),
      controller: controller.searchController,
      hintText: "msg_search_for_barbers".tr,
      onEditingComplete: () { // Added this callback
        FocusScope.of(context).unfocus();
      },
      //  textInputAction: TextInputAction.done,
      prefix: Container(
        margin: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(17), 19.v, ScreenUtil().setWidth(10), 19.v),
        child: CustomImageView(
          svgPath: ImageConstant.imgSearch,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 84.v,
      ),
      suffix: Padding(
        padding: EdgeInsets.only(
          right: ScreenUtil().setWidth(15),
        ),
        child: IconButton(
          onPressed: () {
            controller.searchController.clear();
          },
          icon: Icon(
            Icons.clear,
            color: Colors.grey.shade600,
          ),
        ),
      ),
    ),
  );
}

  Widget _buildAvailableTodaySection() {
    return AvailableToday(controller: controller);
  }

Widget _buildNearbyBarbers(BuildContext context) {
  return SafeArea(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align the title to the left
      children: [
        Text(
          "lbl_nearby_barbers".tr,
          style: CustomTextStyles.titleSmallMontserratPrimaryMedium,
        ),
        SizedBox(height: ScreenUtil().setHeight(20)),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => YourBarberProfile(),));},
                child: BarberCard(
                    "msg_jeno_s_barbershop".tr,
                    "msg_george_st_tel_aviv".tr,
                    ImageConstant.imgRectangle1784442x42),
              ),
            ),
            SizedBox(width: ScreenUtil().setWidth(8)),
            Expanded(
              child: GestureDetector(
                onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => YourBarberProfile(),));},
              child: BarberCard(
                  "lbl_safwan_nazareth2".tr,
                  "msg_el_een_st_nazareth".tr,
                  ImageConstant.imgRectangle178441),
            ),)
          ],
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
          Row(
            children: [
              Expanded(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.4, // or some other value
                      child: BarberCard(
                          "lbl_elias_miilya2".tr,
                          "msg_mar_elias_st_mi_ilya".tr,
                          ImageConstant.imgEllipse4244x44))),
              SizedBox(width: ScreenUtil().setWidth(8)),
              Expanded(
                  child: BarberCard(
                      "lbl_john_s_salon2".tr,
                      "msg_mar_elias_st_haifa".tr,
                      ImageConstant.imgEllipse422)),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(7),
                right: 16.w,
                bottom: ScreenUtil().setHeight(5),
              ),
              child: Text(
                "lbl_see_all".tr,
                style: CustomTextStyles.labelMediumPrimary,
              ),
            ),
          ),
        ],
      ),
    // )
    );
  }

  Widget _buildSeeAll() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(7),
          right: 16.w,
          bottom: ScreenUtil().setHeight(5),
        ),
        child: Text(
          "lbl_see_all".tr,
          style: CustomTextStyles.labelMediumPrimary,
        ),
      ),
    );
  }
}

class AvailableToday extends StatelessWidget {
  final ExploreController controller;

  AvailableToday({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil().setHeight(61),
        right: ScreenUtil().setWidth(2),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(9),
        vertical: ScreenUtil().setHeight(15),
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "lbl_available_today".tr,
                style: CustomTextStyles.titleSmallMontserratPrimaryMedium,
              ),
              Transform.translate(
                offset: Offset(-1, 2.5),
                child: Container(
                  height: ScreenUtil().setHeight(7),
                  width: ScreenUtil().setWidth(7),
                  margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(5),
                    top: ScreenUtil().setHeight(4),
                    bottom: ScreenUtil().setHeight(6),
                  ),
                  decoration: BoxDecoration(
                    color: appTheme.greenA700,
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setWidth(3),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: ScreenUtil().setHeight(96),
              child: Obx(
                () => ListView.separated(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(8),
                    top: ScreenUtil().setHeight(16),
                    right: ScreenUtil().setWidth(8),
                  ),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (
                    context,
                    index,
                  ) {
                    return SizedBox(
                      width: ScreenUtil().setWidth(9),
                    );
                  },
                  itemCount: controller
                      .exploreModelObj.value.userprofileItemList.value.length,
                  itemBuilder: (context, index) {
                    UserprofileItemModel model = controller
                        .exploreModelObj.value.userprofileItemList.value[index];
                    return UserprofileItemWidget(
                      model,
                    );
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(6),
                right: ScreenUtil().setWidth(10),
                bottom: ScreenUtil().setHeight(1),
              ),
              child: Text(
                "lbl_see_all".tr,
                style: CustomTextStyles.labelMediumPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class BarberCard extends StatelessWidget {
//   final String barberName;
//   final String barberLocation;
//   final String imagePath;

//   BarberCard(this.barberName, this.barberLocation, this.imagePath);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         // ... existing barber card code ...
//       ],
//     );
//   }
// }

class BarberCard extends StatelessWidget {
  final String barberName;
  final String barberLocation;
  final String imagePath;

 BarberCard(this.barberName, this.barberLocation, this.imagePath);

@override
Widget build(BuildContext context) {
  return Row(
    children: [
      Expanded( // Wrap the Container with Expanded
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(8),
            vertical: ScreenUtil().setHeight(12),
          ),
          decoration: AppDecoration.outlinePrimary2.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: imagePath,
                height: ScreenUtil().setHeight(42),
                width: ScreenUtil().setWidth(42),
                radius: BorderRadius.circular(
                  ScreenUtil().setWidth(21),
                ),
              ),
              SizedBox(width: ScreenUtil().setWidth(8)), // Added for spacing
              Expanded( // Wrap the Column with Expanded
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      barberName,
                      overflow: TextOverflow.ellipsis, // Handle overflow
                      style: theme.textTheme.labelMedium,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(4)),
                    Text(
                      barberLocation,
                      overflow: TextOverflow.ellipsis, // Handle overflow
                      style: CustomTextStyles.labelMediumGray50001,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(width: ScreenUtil().setWidth(8)),
      // ... add the second barber card in the row here if needed ...
    ],
  );
}
}

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











///Handling route based on bottom click actions
String getCurrentRoute(BottomBarEnum type) {
  switch (type) {
    case BottomBarEnum.Scissorsprimary26x26:
      return AppLinks
          .yourBarberProfile; // Navigate to YourBarberProfile if the user chose their barber
    case BottomBarEnum.Menu:
      return AppLinks
          .explore; // Navigate to ExplorePage if the user chose to explore
    case BottomBarEnum.Profile:
      return AppLinks
          .profile; // Navigate to ProfilePage when the profile icon is clicked
    default:
      return "/";
  }
}


  //     bottomNavigationBar: CustomBottomBar(
  // onChanged: (BottomBarEnum type) {
  //   String route = getCurrentRoute(type);
  //   print("Navigating to: $route");  // This will print the route to the console for debugging
  //       Get.offAllNamed(route);
  // // This will navigate to the respective route
  // },

      // ),