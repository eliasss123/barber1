import 'package:barber_app1/core/app_export.dart';
// import 'package:barber_app1/view/screens/main_app/profile/profile_screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:barber_app1/models/profile_model.dart';

/// A controller class for the ProfilePage.
///
/// This class manages the state of the ProfilePage, including the
/// current ProfileModelObj
class ProfileController extends GetxController {
  ProfileController(this.profileModelObj);

  TextEditingController explorevalueController = TextEditingController();


  Rx<ProfileModel> profileModelObj;

  @override
  void onClose() {
    super.onClose();
    explorevalueController.dispose();
  }
}
