import 'package:barber_app1/controller/explore_controller.dart';
// import 'package:barber_app1/screens/launch/sign.dart';
import 'package:barber_app1/screens/main_app/home/your_barber_profile.dart';
import '../models/userprofile_item_model.dart';
import 'package:barber_app1/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(
    this.userprofileItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofileItemModel userprofileItemModelObj;

  var controller = Get.find<ExploreController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineGreenA.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
      child: ElevatedButton(
        onPressed: () => Get.offAll(() => YourBarberProfile(), transition: Transition.noTransition),
        child: SizedBox(
          width: 96.h,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.h,
                vertical: 7.v,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 2.v),
                  CustomImageView(
                    imagePath: ImageConstant.imgEllipse4236x36,
                    height: 36.adaptSize,
                    width: 36.adaptSize,
                    radius: BorderRadius.circular(
                      18.h,
                    ),
                  ),
                  SizedBox(height: 4.v),
                  Obx(
                    () => Text(
                      userprofileItemModelObj.userName!.value,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Obx(
                      () => Text(
                        userprofileItemModelObj.userLocation!.value,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.labelSmallGray50001,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
