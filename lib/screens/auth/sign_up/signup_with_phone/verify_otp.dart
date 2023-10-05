// import 'controller/screen_four_controller.dart';
import 'package:barber_app1/core/app_export.dart';
import 'package:barber_app1/widgets/custom_pin_code_text_field.dart';
import 'package:flutter/material.dart';
// import 'package:barber_app/view/screens/auth/sign_up/signup_with_phone/name.dart';

// import 'package:barber_app/presentation/verify_opt/models/screen_four_model.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerifyOtp extends StatelessWidget {
  final VerifyController verifyController = VerifyController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 40.h,
                // vertical: 0.v,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "lbl_the_barbers".tr,
                      style: theme.textTheme.headlineLarge,
                    ),
                  ),
                  SizedBox(height: 67.v),
                  Text(
                    "msg_verification_code".tr,
                    style: CustomTextStyles.titleMediumDMSansPrimaryContainer,
                  ),
                  SizedBox(height: 16.v),
                  SizedBox(
                    width: 197.h,
                    child: Text(
                      "msg_enter_the_code_that".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall!.copyWith(
                        height: 1.50,
                      ),
                    ),
                  ),
                  CustomPinCodeTextField(
                    context: context,
                    margin: EdgeInsets.fromLTRB(21.h, 50.v, 25.h, 5.v),
                    controller:
                        verifyController.otpController, // Corrected line
                    onChanged: (value) {},
                    onCompleted: (value) {
                      Get.toNamed(AppLinks.chooseBarber);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),),),
      );

  }
}

/// A controller class for the VerifyScreen.
///
/// This class manages the state of the VerifyScreen, including the
/// current verifyModelObj
class VerifyModel {}

class VerifyController extends GetxController with CodeAutoFill {
  final TextEditingController otpController = TextEditingController();

  @override
  void codeUpdated() {
    otpController.text = code ?? '';
  }


  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }
}



// // import 'controller/screen_four_controller.dart';
// import 'package:barber_app1/core/app_export.dart';
// import 'package:barber_app1/widgets/custom_pin_code_text_field.dart';
// import 'package:flutter/material.dart';
// // import 'package:barber_app/view/screens/auth/sign_up/signup_with_phone/name.dart';

// // import 'package:barber_app/presentation/verify_opt/models/screen_four_model.dart';
// import 'package:sms_autofill/sms_autofill.dart';

// class VerifyOtp extends StatelessWidget {
//   final VerifyController verifyController = VerifyController();

//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);

//     return Container(
//       height: double.infinity,
//           width: double.infinity,
//           color: Colors.white,
//       child: SafeArea(
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: Scaffold(
//             resizeToAvoidBottomInset: false,
//             body: Container(
//               width: double.maxFinite,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 40.h,
//                 // vertical: 0.v,
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Align(
//                     alignment: Alignment.center,
//                     child: Text(
//                       "lbl_the_barbers".tr,
//                       style: theme.textTheme.headlineLarge,
//                     ),
//                   ),
//                   SizedBox(height: 67.v),
//                   Text(
//                     "msg_verification_code".tr,
//                     style: CustomTextStyles.titleMediumDMSansPrimaryContainer,
//                   ),
//                   SizedBox(height: 16.v),
//                   SizedBox(
//                     width: 197.h,
//                     child: Text(
//                       "msg_enter_the_code_that".tr,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: theme.textTheme.bodySmall!.copyWith(
//                         height: 1.50,
//                       ),
//                     ),
//                   ),
//                   CustomPinCodeTextField(
//                     context: context,
//                     margin: EdgeInsets.fromLTRB(21.h, 50.v, 25.h, 5.v),
//                     controller: verifyController.otpController,  // Corrected line
//                     onChanged: (value) {},
//                     onCompleted: (value) {
//                       Get.toNamed(AppLinks.chooseBarber);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



// /// A controller class for the VerifyScreen.
// ///
// /// This class manages the state of the VerifyScreen, including the
// /// current verifyModelObj
// class VerifyModel {}
// class VerifyController extends GetxController with CodeAutoFill {
//   final TextEditingController otpController = TextEditingController();

//   @override
//   void codeUpdated() {
//     otpController.text = code ?? '';
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     listenForCode();
//   }
// }
