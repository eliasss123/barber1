import 'package:barber_app1/controller/your_barber_controller.dart';
import 'package:barber_app1/models/your_barber_model.dart';
import 'package:barber_app1/core/app_export.dart';
import 'package:barber_app1/widgets/screen_nine.dart';
import 'package:flutter/material.dart';
import 'package:barber_app1/widgets/custom_elevated_button.dart';

class DaySelectionWidget extends StatelessWidget {
  final YourBarberController controller;

  DaySelectionWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: screenNineHeight,
        child: Container(
          width: 314.h,
          margin: EdgeInsets.fromLTRB(38.h, 17.v, 38.h, 5.v),
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 23.v,
          ),
          decoration: AppDecoration.fillPrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder14,
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 4.h),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (controller.activeDropdown.value.endsWith("_day")) {
                          // Remove the "_day" suffix to return to the open dropdown
                          controller.activeDropdown.value = controller
                              .activeDropdown.value
                              .replaceAll("_day", "");
                        }
                      },
                      // GestureDetector(
                      //   onTap: () {
                      //     controller
                      //         .toggleDropDown(controller.activeDropdown.value);
                      //   },
                      child: CustomImageView(
                        svgPath: ImageConstant.imgArrowleft,
                        height: 14.v,
                        width: 8.h,
                        margin: EdgeInsets.only(
                          top: 3.v,
                          bottom: 2.v,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 86.h),
                      child: Text(
                        "lbl_select_day".tr,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.v),
            Text(
              "msg_note_that_you_can".tr,
              style: CustomTextStyles.labelMediumMontserratPrimary,
            ),
            GestureDetector(
        onTap: () {
          controller.selectedDay.value = "Thursday";
              controller.toggleDaySelection(); // Transition to TimeSelectionWidget

        },
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 28.v,
                  right: 44.h,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "lbl_thursday".tr,
                        style: controller.selectedDay.value == "Thursday"
                            ? CustomTextStyles.titleMediumPrimaryBold
                                .copyWith(color: Colors.black)
                            : CustomTextStyles.titleMediumPrimaryBold,
                      ),
                      TextSpan(
                        text: " ",
                      ),
                      TextSpan(
                        text: "lbl_today".tr,
                        style: controller.selectedDay.value == "Thursday"
                            ? CustomTextStyles.titleSmallMontserratPrimarySemiBold
                                .copyWith(color: Colors.black)
                            : CustomTextStyles
                                .titleSmallMontserratPrimarySemiBold,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),),
            SizedBox(height: 18.v),
            GestureDetector(
              onTap: () {
                controller.selectedDay.value = "Friday";
                              controller.toggleDaySelection(); // Transition to TimeSelectionWidget

              },
              child: Text(
                "lbl_friday".tr,
                style: controller.selectedDay.value == "Friday"
                    ? CustomTextStyles.titleMediumBold18
                        .copyWith(color: Colors.black)
                    : CustomTextStyles.titleMediumPrimary,
              ),
            ),
            SizedBox(height: 18.v),
            GestureDetector(
              onTap: () {
                controller.selectedDay.value = "Saturday";
                              controller.toggleDaySelection(); // Transition to TimeSelectionWidget

              },
              child: Text(
                "lbl_saturday".tr,
                style: controller.selectedDay.value == "Saturday"
                    ? CustomTextStyles.titleMediumPrimary
                        .copyWith(color: Colors.black)
                    : CustomTextStyles.titleMediumPrimary,
              ),
            ),
            SizedBox(height: 18.v),
            GestureDetector(
              onTap: () {
                controller.selectedDay.value = "Sunday";
                              controller.toggleDaySelection(); // Transition to TimeSelectionWidget

              },
              child: Text(
                "lbl_sunday".tr,
                style: controller.selectedDay.value == "Sunday"
                    ? CustomTextStyles.titleMediumPrimary
                        .copyWith(color: Colors.black)
                    : CustomTextStyles.titleMediumPrimary,
              ),
            ),
            SizedBox(height: 18.v),
            GestureDetector(
              onTap: () {
                controller.selectedDay.value = "Monday";
                              controller.toggleDaySelection(); // Transition to TimeSelectionWidget

              },
              child: Text(
                "lbl_monday".tr,
                style: controller.selectedDay.value == "Monday"
                    ? CustomTextStyles.titleMediumPrimary
                        .copyWith(color: Colors.black)
                    : CustomTextStyles.titleMediumPrimary,
              ),
            ),
            SizedBox(height: 4.v),
          ]),
        ),
      );
    });
  }
}
