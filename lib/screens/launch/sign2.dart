

// // import 'controller/screen_one_controller.dart';
// import 'package:barber_app1/core/app_export.dart';
// import 'package:barber_app1/core/utils/validation_functions.dart';
// // import 'package:barber_app1/generated/assets.dart';
// import 'package:barber_app1/screens/auth/sign_up/signup_with_phone/verify_otp.dart';
// import 'package:barber_app1/widgets/custom_elevated_button.dart';
// import 'package:barber_app1/widgets/custom_text_form_field.dart';
// import 'package:flutter/material.dart';

// // ignore_for_file: must_be_immutable
// class Sign extends StatelessWidget {
//   Sign({Key? key}) : super(key: key);

//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
  
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);
//     // ////var platform = Theme.of(context).platform;
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Form(
//           key: _formKey,
//           child: Container(
//             width: double.maxFinite,
//             padding: EdgeInsets.symmetric(horizontal: 46.h, vertical: 34.v),
//             child: Column(
//               children: [
//                 Text("lbl_the_barbers".tr,
//                     style: theme.textTheme.headlineMedium),
//                 SizedBox(height: 21.v),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                           height: 59.v,
//                           width: 75.h,
//                           child: Stack(alignment: Alignment.topLeft, children: [
//                             Transform.translate(offset: Offset(-6,0),
//                               child: CustomImageView(
//                                 svgPath: ImageConstant.imgHead,
//                                 height: 46.adaptSize,
//                                 width: 46.adaptSize,
//                                 alignment: Alignment.bottomRight),),
//                             CustomImageView(
//                                 svgPath: ImageConstant.imgScissorsOne,
//                                 height: 29.adaptSize,
//                                 width: 29.adaptSize,
//                                 alignment: Alignment.topLeft)
//                           ])),
//                       CustomImageView(
//                           svgPath: ImageConstant.imgScissorsTwo,
//                           height: 27.adaptSize,
//                           width: 27.adaptSize,
//                           margin: EdgeInsets.only(left: 1.h, bottom: 32.v))                    ]),
//                     Transform.translate(offset: Offset(0,2), 
//                     child: CustomImageView(
//                     svgPath: ImageConstant.imgScissorsPrimary38x38,
//                     alignment: Alignment.topCenter,
//                     height: 38.adaptSize,
//                     width: 38.adaptSize),),
//                 SizedBox(height: 61.v),
//                 CustomTextFormField(
//                     // ////controller: controller.firstNameController,
//                     hintText: "lbl_first_name".tr,
//                     validator: (value) {
//                       if (!isText(value)) {
//                         return "Please enter valid text";
//                       }
//                       return null;
//                     }),
//                 SizedBox(height: 14.v),
//                 CustomTextFormField(
//                     // controller: controller.lastNameController,
//                     hintText: "lbl_last_name".tr,
//                     validator: (value) {
//                       if (!isText(value)) {
//                         return "Please enter valid text";
//                       }
//                       return null;
//                     }),
//                 SizedBox(height: 14.v),
//                 CustomTextFormField(
//                     // controller: controller.phoneNumberController,
//                     hintText: "msg_your_phone_number".tr,
//                     hintStyle: CustomTextStyles.bodyMediumOnPrimary,
//                     textInputAction: TextInputAction.done,
//                     textInputType: TextInputType.phone,
//                     prefix: Container(
//                         margin: EdgeInsets.fromLTRB(19.h, 18.v, 13.h, 20.v),
//                         child:
//                             CustomImageView(svgPath: ImageConstant.imgPhone)),
//                     prefixConstraints: BoxConstraints(maxHeight: 77.v),
//                     validator: (value) {
//                       if (!isValidPhone(value)) {
//                         return "Please enter valid phone number";
//                       }
//                       return null;
//                     },
//                     contentPadding:
//                         EdgeInsets.only(top: 28.v, right: 30.h, bottom: 19.v)),
//                 CustomElevatedButton(
//                     onTap: () => Get.offAll(() => VerifyOtp()),
//                     height: 58.v,
//                     text: "lbl_continue".tr,
//                     margin: EdgeInsets.fromLTRB(18.h, 86.v, 18.h, 5.v),
//                     buttonStyle: CustomButtonStyles.fillPrimary,
//                     buttonTextStyle: CustomTextStyles.titleSmallWhiteA700)
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
