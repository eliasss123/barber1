import 'package:barber_app1/screens/main_app/home/your_barber_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/choose_barber_controller.dart';
import '../models/jenobarbershop_item_model.dart';
import 'package:barber_app1/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class JenobarbershopItemWidget extends StatelessWidget {
  JenobarbershopItemWidget(
    this.jenobarbershopItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  JenobarbershopItemModel jenobarbershopItemModelObj;

  var controller = Get.find<ChooseBarberController>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // Store the user's choice that they chose their barber
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('choseBarber', true);

        Get.offAll(() => YourBarberProfile(),
            transition: Transition.noTransition);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.h,
          vertical: 14.v,
        ),
        decoration: AppDecoration.fillErrorContainer.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgRectangle17844,
              height: 52.adaptSize,
              width: 52.adaptSize,
              radius: BorderRadius.circular(
                26.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 12.h,
                bottom: 9.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      jenobarbershopItemModelObj.shopName!.value,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(height: 5.v),
                  Obx(
                    () => Text(
                      jenobarbershopItemModelObj.shopAddress!.value,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
