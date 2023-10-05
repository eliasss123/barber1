// import 'package:barber_app1/controller/haircut_select_controller.dart';
// import 'package:barber_app1/models/haircut_select_model.dart';
import 'package:barber_app1/controller/your_barber_controller.dart';
import 'package:barber_app1/models/your_barber_model.dart';
import 'package:barber_app1/core/app_export.dart';
import 'package:flutter/material.dart';

enum ButtonType { SelectDay, SelectTime, Continue }

// ignore: must_be_immutable

class SelectdayItemWidget extends StatelessWidget {
  final SelectdayItemModel? selectdayItemModelObj;
  final ButtonType buttonType;
  final VoidCallback? onTap;
  final String buttonText; // Add this parameter

  SelectdayItemWidget({
    Key? key,
    this.selectdayItemModelObj,
    required this.buttonType,
    required this.buttonText, // Add this parameter
    this.onTap,
  }) : super(key: key);

  var controller = Get.find<YourBarberController>();

  @override
  Widget build(BuildContext context) {
    List<Widget> rowChildren = [];

    switch (buttonType) {
      case ButtonType.SelectDay:
        rowChildren.add(Text(
          "lbl_select_day".tr, // Use a default text for day
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleMedium,
        ));
        rowChildren.add(Spacer());
        rowChildren.add(Padding(
          padding: EdgeInsets.symmetric(vertical: 3.v),
          child: Text(
            buttonText, // Use the provided buttonText property here
            style: CustomTextStyles.labelLargeMontserratPrimary,
          ),
        ));
        rowChildren.add(CustomImageView(
          svgPath: ImageConstant.imgArrowright,
          height: 14.v,
          width: 8.h,
          margin: EdgeInsets.fromLTRB(11.h, 3.v, 1.h, 4.v),
        ));
        break;
      case ButtonType.SelectTime:
        rowChildren.add(Text(
          "lbl_select_time".tr, // Use a default text for time
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleMedium,
        ));
        rowChildren.add(Spacer());
        rowChildren.add(Padding(
          padding: EdgeInsets.symmetric(vertical: 2.v),
          child: Text(
            buttonText, // Use the provided buttonText property here
            style: CustomTextStyles.labelLargeMontserratPrimary,
          ),
        ));
        rowChildren.add(CustomImageView(
          svgPath: ImageConstant.imgArrowright,
          height: 14.v,
          width: 8.h,
          margin: EdgeInsets.fromLTRB(13.h, 3.v, 1.h, 3.v),
        ));
        break;
      case ButtonType.Continue:
        rowChildren.add(Expanded(
          child: Center(
            child: Text(
              buttonText,
              overflow: TextOverflow.ellipsis,
              style: buttonType == ButtonType.Continue
                  ? theme.textTheme.titleMedium?.copyWith(color: Colors.white) ??
                      TextStyle(color: Colors.red)
                  : theme.textTheme.titleMedium,
            ),
          ),
        ));
        break;
    }

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        final offsetTween =
            Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0));
        return SlideTransition(
          child: child,
          position: offsetTween.animate(animation),
        );
      },
    child: GestureDetector(
        onTap: () {
          if (buttonType == ButtonType.SelectDay) {
            controller.toggleDaySelection();
          } else if (buttonType == ButtonType.SelectTime) {
            controller.toggleTimeSelection();
          }
          // Add other conditions for other button types if needed
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: buttonType == ButtonType.Continue ? 23.v : 21.v,
          ),
          margin: EdgeInsets.only(
            top: buttonType == ButtonType.Continue ? 6.v : 0,
            bottom: buttonType == ButtonType.Continue ? 6.v : 0,
          ),
          decoration: buttonType == ButtonType.Continue
              ? AppDecoration.fillWhiteA.copyWith(
                  color: Colors.black.withOpacity(0.28),
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                )
              : AppDecoration.fillWhiteA.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: rowChildren,
          ),
        ),
      ),
    );
  }
}
