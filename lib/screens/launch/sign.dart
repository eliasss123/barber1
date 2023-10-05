// import 'controller/screen_one_controller.dart';
import 'package:barber_app1/core/app_export.dart';
import 'package:barber_app1/core/utils/validation_functions.dart';
// import 'package:barber_app1/generated/assets.dart';
import 'package:barber_app1/screens/auth/sign_up/signup_with_phone/verify_otp.dart';
import 'package:barber_app1/widgets/custom_elevated_button.dart';
import 'package:barber_app1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class CustomTextFieldWrapper extends StatelessWidget {
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final String hintText;
  final String Function(String? value)? validator;

  CustomTextFieldWrapper({
    required this.focusNode,
    required this.nextFocusNode,
    required this.hintText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      focusNode: focusNode,
      onFieldSubmitted: (term) {
        focusNode.unfocus();
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
      hintText: hintText,
      validator: validator,
    );
  }
}

class Sign extends StatelessWidget {
  Sign({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();

  // @override
  // Widget build(BuildContext context) {
  //   return GestureDetector(
  //     onTap: () {
  //       FocusScope.of(context).unfocus();
  //     },
  //     child: SafeArea(
  //       child: Scaffold(
  //         resizeToAvoidBottomInset: false,
  //         body: Container(
  //           width: double.infinity,  // Fills the width
  //           height: double.infinity, // Fills the height
  //           color: Colors.white,    // Set your background color here
  //           child: Form(
  //             key: _formKey,
  //             child: Container(
  //               width: double.infinity, // Ensuring Container takes all the width
  //               padding: EdgeInsets.symmetric(horizontal: 46.h, vertical: 34.v),
  //               // width: double.maxFinite,
  //               // padding: EdgeInsets.symmetric(horizontal: 46.h, vertical: 34.v),
  //               child: Column(
  //                 children: [

  // Widget build(BuildContext context) {
  // return Container(
  //   height: MediaQuery.of(context).size.height,
  //   width: MediaQuery.of(context).size.width,
  //   color: Colors.white, // Full screen background color
  //   child: MaterialApp(
  //     home: Scaffold(
  //       backgroundColor: Colors.transparent, // Make it transparent to see the Container color
  //       body:

  @override
  Widget build(BuildContext context) {
     // Check if the keyboard is visible
    // bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Hide keyboard when tapping outside
        }, child : SafeArea(
          child: Container(
            height: Get.height,
            width: Get.width,
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     body: Container(
    //       height: double.infinity,
    //       width: double.infinity,
    //       color: Colors.white, // or any color you want
          child: Form(
            key: _formKey,

            // child: SingleChildScrollView(
            child: Column(
              children: [
                Text("lbl_the_barbers".tr,
                    style: theme.textTheme.headlineLarge),
                SizedBox(height: 22.v),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 59.v,
                          width: 72.h,
                          child: Stack(alignment: Alignment.topLeft, children: [
                            Transform.translate(
                              offset: Platform.isIOS
                                  ? Offset(-3, 0)
                                  : Offset(
                                      -5, 0), // Change the values as needed
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgHead,
                                  height: 46.adaptSize,
                                  width: 46.adaptSize,
                                  alignment: Alignment.bottomRight),
                            ),
                            CustomImageView(
                                svgPath: ImageConstant.imgScissorsOne,
                                height: 29.adaptSize,
                                width: 29.adaptSize,
                                alignment: Alignment.topLeft)
                          ])),
                      Transform.translate(
                          offset: Offset(-1, 0),
                          child: CustomImageView(
                              svgPath: ImageConstant.imgScissorsTwo,
                              height: 27.adaptSize,
                              width: 27.adaptSize,
                              margin: EdgeInsets.only(left: 1.h, bottom: 32.v)))
                    ]),
                Transform.translate(
                  offset: Offset(-1, 2),
                  child: CustomImageView(
                      svgPath: ImageConstant.imgScissorsPrimary38x38,
                      alignment: Alignment.topCenter,
                      height: 38.adaptSize,
                      width: 38.adaptSize),
                ),
                SizedBox(height: 71.v),
                Container(
                  width: 300.h,
                  child: CustomTextFormField(
                      focusNode: firstNameFocusNode,
                      onFieldSubmitted: (term) {
                        firstNameFocusNode.unfocus();
                        FocusScope.of(context).requestFocus(lastNameFocusNode);
                      },
                      hintText: "lbl_first_name".tr,
                                                                  textInputAction: TextInputAction.next, // Next button

                      validator: (value) {
                        if (!isText(value)) {
                          return "Please enter valid text";
                        }
                        return null;
                      }),
                ),
                SizedBox(height: 14.v),
                Container(
                  width: 300.h,
                  child: CustomTextFormField(
                      focusNode: lastNameFocusNode,
                      onFieldSubmitted: (term) {
                        lastNameFocusNode.unfocus();
                        FocusScope.of(context).requestFocus(phoneFocusNode);
                      },
                      hintText: "lbl_last_name".tr,
                                            textInputAction: TextInputAction.next, // Next button

                      validator: (value) {
                        if (!isText(value)) {
                          return "Please enter valid text";
                        }
                        return null;
                      }),
                ),
                SizedBox(height: 14.v),
                Container(
                  width: 300.h,
                  child: CustomTextFormField(
                      // controller: controller.phoneNumberController,
                      hintText: "msg_your_phone_number".tr,
                      hintStyle: CustomTextStyles.bodyMediumOnPrimary,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.phone,
                      prefix: Container(
                          margin: EdgeInsets.fromLTRB(19.h, 18.v, 13.h, 20.v),
                          child:
                              CustomImageView(svgPath: ImageConstant.imgPhone)),
                      prefixConstraints: BoxConstraints(maxHeight: 77.v),
                      validator: (value) {
                        if (!isValidPhone(value)) {
                          return "Please enter valid phone number";
                        }
                        return null;
                      },
                      contentPadding: EdgeInsets.only(
                          top: 28.v, right: 30.h, bottom: 19.v)),
                ),
                                  // SizedBox(height: isKeyboardVisible ? 0 : 10.v), // Adjust the space based on keyboard visibility

                SizedBox(height: 10.v),
                  Container(
                  width: 284.h,
                  child: CustomElevatedButton(
                      onTap: () => Get.to(() => VerifyOtp(),
                          transition: Transition.noTransition),
                      height: 60.v,
                      text: "lbl_continue".tr,
                      margin: EdgeInsets.fromLTRB(18.h, 86.v, 18.h, 5.v),
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      buttonTextStyle: CustomTextStyles.titleSmallWhiteA700),
                ),
              ],
            ),
          ),
        ),
      ),)
    );
    // );
    // );
  }
}


