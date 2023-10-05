import 'package:barber_app1/screens/main_app/home/explore.dart';
import 'package:barber_app1/screens/main_app/home/your_barber_profile.dart';
import '/widgets/jenobarbershop_item_widget.dart';
import 'package:barber_app1/controller/choose_barber_controller.dart';
import 'package:barber_app1/core/app_export.dart';
import 'package:barber_app1/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:barber_app1/models/jenobarbershop_item_model.dart';
import 'package:get/get.dart';

class MyBarber extends StatefulWidget {
  @override
  _MyBarberState createState() => _MyBarberState();
}

class _MyBarberState extends State<MyBarber> {
  final ChooseBarberController controller = Get.put(ChooseBarberController());

  // Navigate to the previous screen
  void onTapArrowleftone() {
    Get.back();
  }
  
@override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    bool isIos = platform == TargetPlatform.iOS;
      return Scaffold(
        appBar: PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight), // Default AppBar height
    child: Transform.translate(
      offset: Offset(0, 18.0), // Adjust the values as needed
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: BarberTitle(),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
    ),
  ),
        body: SafeArea(
          child: Container(
            height: Get.height,
            width: Get.width,
            padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                // SizedBox(height: 0.h),
                // BarberTitle(),
                SizedBox(height: 58),
                PreferredBarberContainer(
                  child: ChooseBarberContent(controller: controller),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.h,
                    top: 19.v,
                    right: 10.h,
                  ),
                ),
                // SizedBox(height: 17.v),
                // OrDivider(),
                SizedBox(height: 34),
              ],
            ),
        ),),
      );}
  }
    


class BarberTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "lbl_my_barber".tr,
      style: theme.textTheme.headlineLarge,
    );
  }
}

class ChooseBarberContent extends StatelessWidget {
  final ChooseBarberController controller;

  ChooseBarberContent({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 11);
        },
        itemCount: controller.ChooseBarberModelObj.value.jenobarbershopItemList.value.length,
        itemBuilder: (context, index) {
          JenobarbershopItemModel model = controller.ChooseBarberModelObj.value.jenobarbershopItemList.value[index];
          return JenobarbershopItemWidget(model);
        },
      ),
    );
  }
}


class PreferredBarberContainer extends StatelessWidget {
  final Widget child;

  PreferredBarberContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Expanded(
      child: Container(
        height: screenHeight * 0.2,
        width: 300.h,
        // width: screenWidth * 0.85,  // 80% of screen width
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        decoration: AppDecoration.outlinePrimary.copyWith(
          borderRadius: BorderRadiusStyle.customBorderTL10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 29.v),
            Text(
              "msg_choose_your_preferred".tr,
              style: theme.textTheme.bodyLarge,
            ),
            SizedBox(height: 23.v),
            Expanded(child: child),  // ChooseBarberContent
          ],
        ),
      ),
    );
  }
}
