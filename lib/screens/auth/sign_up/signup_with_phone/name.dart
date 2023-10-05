import 'package:barber_app1/core/app_export.dart';
// import 'package:barber_app1/presentation/screen_four_screen/models/screen_four_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';


class VerifyController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  Rx<VerifyModel> verifyModelObj = VerifyModel().obs;

  @override
  void codeUpdated() {
    otpController.value.text = code ?? '';
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }
}

class VerifyModel {}