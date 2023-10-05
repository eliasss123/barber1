import 'package:barber_app1/core/app_export.dart';
import 'package:barber_app1/models/settings_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SettingsScreen.
///
/// This class manages the state of the SettingsScreen, including the
/// current settingsScreenModelObj
class SettingsScreenController extends GetxController {
  
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  Rx<SettingsScreenModel> settingsScreenModelObj = SettingsScreenModel().obs;

  @override
  void onClose() {
    super.onClose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
  }
}


