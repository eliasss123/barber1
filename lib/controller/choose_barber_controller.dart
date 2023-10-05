import 'package:barber_app1/core/app_export.dart';
import 'package:barber_app1/models/choose_barber_model.dart';
/// A controller class for the ChooseBarber.
///
/// This class manages the state of the ChooseBarber, including the
/// current ChooseBarberModelObj
class ChooseBarberController extends GetxController {
  Rx<ChooseBarberModel> ChooseBarberModelObj = ChooseBarberModel().obs;

}

