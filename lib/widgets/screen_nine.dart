import 'package:barber_app1/controller/your_barber_controller.dart';
import 'package:barber_app1/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:barber_app1/widgets/select_day.dart';
import 'custom_elevated_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

// class ScreenNine extends StatefulWidget {
//   final YourBarberController controller;
//   final String title;
//   final String price;
//   final String dropdownType;

//   // final GlobalKey _screenNineKey = GlobalKey();

//   ScreenNine({
//     required this.controller,
//     required this.title,
//     required this.price,
//     required this.dropdownType,
//   });

//   @override
//   _ScreenNineState createState() => _ScreenNineState();
// }

// double? screenNineHeight;

// class _ScreenNineState extends State<ScreenNine> {
//   final GlobalKey _screenNineKey = GlobalKey();
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance!.addPostFrameCallback((_) {
//       final RenderBox box =
//           _screenNineKey.currentContext!.findRenderObject() as RenderBox;
//       screenNineHeight = box.size.height;
//       setState(() {}); // Trigger a rebuild to reflect the height in the UI
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => widget.controller.toggleDropDown(widget.dropdownType),
//       child: Expanded(
//         child: SizedBox(
//           width: double.maxFinite,
//           child: Container(
//             key: _screenNineKey, // Assign the key here

//             margin: EdgeInsets.fromLTRB(38.h, 17.v, 38.h, 3.v),
//             padding: EdgeInsets.symmetric(
//               horizontal: 20.h,
//               vertical: 11.v,
//             ),
//             decoration: AppDecoration.fillPrimary.copyWith(
//               borderRadius: BorderRadiusStyle.roundedBorder14,
//             ),
//             child: SingleChildScrollView(
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(
//                     maxHeight: MediaQuery.of(context).size.height -
//                         100.v), // Adjust this value as needed
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(
//                         left: 3.h,
//                         top: 14.v,
//                         right: 12.h,
//                       ),
//                       child: GestureDetector(
//                         onTap: () => widget.controller.toggleDropDown(
//                             widget.dropdownType), // Add this line
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             RichText(
//                               text: TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: widget
//                                         .title, // Use the title parameter here
//                                     style: theme.textTheme.titleMedium,
//                                   ),
//                                   TextSpan(
//                                     text: widget
//                                         .price, // Use the price parameter here
//                                     style:
//                                         CustomTextStyles.titleMediumPrimary_1,
//                                   ),
//                                 ],
//                               ),
//                               textAlign: TextAlign.left,
//                             ),
//                             CustomImageView(
//                               svgPath: ImageConstant.imgArrowup,
//                               height: 8.v,
//                               width: 14.h,
//                               margin: EdgeInsets.only(
//                                 top: 10.v,
//                                 bottom: 5.v,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     // SelectdayItemWidget(
//                     //   buttonType: ButtonType.SelectDay,
//                     // ),
//                     Obx(() {
//   return SelectdayItemWidget(
//     buttonType: ButtonType.SelectDay,
//     onTap: () {
//       // Handle the day selection logic here if needed
//       widget.controller.toggleDaySelection();
//     },
//     buttonText: widget.controller.selectedDay.value.isEmpty
//         ? "Select Day" // Default text if no day is selected
//         : widget.controller.selectedDay.value,
//     // Add any style you want for the text
//   );
// }),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Obx(() {
//   return SelectdayItemWidget(
//     buttonType: ButtonType.SelectTime,
//     onTap: () {
//       // Handle the time selection logic here if needed
//       widget.controller.toggleTimeSelection();
//     },
//     buttonText: widget.controller.selectedTime.value.isEmpty
//         ? "Select Time" // Default text if no time is selected
//         : widget.controller.selectedTime.value,
//     // Add any style you want for the text
//   );
// }),
//                     // SelectdayItemWidget(
//                     //   buttonType: ButtonType.SelectTime,
//                     //   // onTap: controller.toggleTimeSelection,
//                     // ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     SelectdayItemWidget(
//                       buttonType: ButtonType.Continue,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class ScreenNine extends StatefulWidget {
  final YourBarberController controller;
  final String title;
  final String price;
  final String dropdownType;

  ScreenNine({
    required this.controller,
    required this.title,
    required this.price,
    required this.dropdownType,
  });

  @override
  _ScreenNineState createState() => _ScreenNineState();
}
double? screenNineHeight;

class _ScreenNineState extends State<ScreenNine> {
  final GlobalKey _screenNineKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    bool isConfirmEnabled =
        widget.controller.selectedDay.isNotEmpty && widget.controller.selectedTime.isNotEmpty;

    return GestureDetector(
      onTap: () {
        if (isConfirmEnabled) {
          widget.controller.toggleDropDown(widget.dropdownType);
        }
      },
      child: Expanded(
        child: SizedBox(
          width: double.maxFinite,
          child: Container(
            key: _screenNineKey,
            margin: EdgeInsets.fromLTRB(38.h, 17.v, 38.h, 3.v),
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 11.v,
            ),
            decoration: AppDecoration.fillPrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder14,
            ),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height - 100.v,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 3.h,
                        top: 14.v,
                        right: 12.h,
                      ),
                      child: GestureDetector(
                        onTap: () => widget.controller.toggleDropDown(widget.dropdownType),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: widget.title,
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  TextSpan(
                                    text: widget.price,
                                    style: CustomTextStyles.titleMediumPrimary_1,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgArrowup,
                              height: 8.v,
                              width: 14.h,
                              margin: EdgeInsets.only(
                                top: 10.v,
                                bottom: 5.v,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    
                    SelectdayItemWidget(
  buttonType: ButtonType.SelectDay,
  buttonText: widget.controller.selectedDay.isNotEmpty
      ? widget.controller.selectedDay.value // Display selected day
      : "", // Default text
),
SizedBox(
  height: 10,
),
SelectdayItemWidget(
  buttonType: ButtonType.SelectTime,
  buttonText: widget.controller.selectedTime.isNotEmpty
      ? widget.controller.selectedTime.value // Display selected time
      : "", // Default text
),


                    SizedBox(
                      height: 3,
                    ),
                    CustomElevatedButton(
                      height: 58.v,
                      text: "lbl_confirm".tr,
                      margin: EdgeInsets.only(
                        left: 3.h,
                        top: 14.v,
                        right: 9.h,
                        bottom: 4.v,
                      ),
                      buttonStyle: isConfirmEnabled
                          ? CustomButtonStyles.fillPrimaryTL101 // Use black style
                          : CustomButtonStyles.fillPrimaryT444, // Use grayed out style
                      buttonTextStyle: isConfirmEnabled
                          ? CustomTextStyles.titleMediumWhiteA700 // Use white text style
                          : CustomTextStyles.titleMediumWhiteA700.copyWith(color: Colors.white), // Use grayed out text style
                      onTap: isConfirmEnabled
    ? () async {
        // Handle the confirmation logic here
        final selectedDay = widget.controller.selectedDay.value;
        final selectedTime = widget.controller.selectedTime.value;
        print("Selected Day: $selectedDay");
        print("Selected Time: $selectedTime");
        widget.controller.toggleDropDown(widget.dropdownType);
        widget.controller.resetSelections();

        // Use SharedPreferences to store the selected day and time
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('appointmentDay', selectedDay);
        await prefs.setString('appointmentTime', selectedTime);

        // Increment the notification count or any other logic you want to perform
        widget.controller.incrementNotification();
      }
    : null, // Disable the button if not enabled, // Disable the button if not enabled
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
