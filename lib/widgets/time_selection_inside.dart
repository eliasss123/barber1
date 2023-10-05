import 'package:barber_app1/controller/your_barber_controller.dart';
import 'package:barber_app1/models/your_barber_model.dart';
import 'package:barber_app1/core/app_export.dart';
import 'package:barber_app1/widgets/screen_nine.dart';
import 'package:flutter/material.dart';
import 'package:barber_app1/widgets/custom_elevated_button.dart';

class TimeSelectionWidget extends StatelessWidget {
  final YourBarberController controller;

  TimeSelectionWidget({required this.controller});

  // List of time slots for demonstration. You can modify this list as needed.
  final List<String> timeSlots = [
    "10:00-10:30",
    "10:30-11:00",
    "11:00-11:30",
    "13:00-13:30",
    "14:30-15:00",
    "15:00-15:30",

    // ... add more time slots as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenNineHeight,
      child: Container(
        margin: EdgeInsets.fromLTRB(38.h, 17.v, 38.h, 5.v),
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        decoration: AppDecoration.fillPrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder14,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 20.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (controller.activeDropdown.value.endsWith("_time")) {
                        controller.activeDropdown.value = controller
                            .activeDropdown.value
                            .replaceAll("_time", "");
                      }
                    },
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
                    padding: EdgeInsets.only(left: 82.h),
                    child: Text(
                      "lbl_select_time".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 9.v),
            Text(
              "msg_choose_your_preferred2".tr,
              style: CustomTextStyles.labelMediumMontserratPrimary,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 57.h,
                top: 14.v,
                right: 57.h,
              ),
              padding: EdgeInsets.symmetric(horizontal: 11.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusStyle.roundedBorder5,
              ),
              child: Container(
                height: 226.5.v, // Set a fixed height for the scrollable container
                child: SingleChildScrollView(
                  child: Obx(() {
                    return Column(
                      children: timeSlots.map((slot) => Column(
                        children: [
                          _buildTimeButton(slot, "lbl_${slot.replaceAll("-", "_").replaceAll(":", "_")}".tr),
                          SizedBox(height: 8.v),
                        ],
                      )).toList(),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeButton(String timeValue, String label) {
    print(
        "Button time: $timeValue, Selected time: ${controller.selectedTime.value}");

    return GestureDetector(
        // onTap: () => controller.setSelectedTime(timeValue),
        child: Obx(
      () => CustomElevatedButton(
        onTap: () => controller.setSelectedTime(timeValue),
        
        text: label,
        buttonStyle: controller.selectedTime.value == timeValue
            ? CustomButtonStyles.fillPrimaryTL8
            : null, // Use the original style when not selected
        buttonTextStyle: controller.selectedTime.value == timeValue
            ? CustomTextStyles.titleSmallMontserratWhiteA700
                .copyWith(color: Colors.white)
            : CustomTextStyles
                .titleSmallMontserratPrimary, // Explicitly set the default style
      ),
    ));
  }
}
