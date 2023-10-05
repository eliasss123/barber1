import 'package:barber_app1/core/app_export.dart';
// import 'package:barber_app1/view/screens/main_app/home/appointments.dart';
import 'package:barber_app1/models/appointments_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
/// A controller class for the AppointmentsPage.
///
/// This class manages the state of the AppointmentsPage, including the
/// current AppointmentsModelObj
class AppointmentsController extends GetxController {
  // var hasAppointment = false.obs; // Observable to track if there's an appointment
    var hasAppointment = true.obs; // Add this line

  
  AppointmentsController(this.appointmentsModelObj);

 Future<void> deleteAppointment() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('appointmentDay');
    await prefs.remove('appointmentTime');
    // If there are other keys related to appointments, remove them here too.
    // Update the UI or inform the UI to update. 
    // If you're using GetX for state management, you might update an Rx variable here to trigger a UI update.
  }


  Future<void> selectAppointment(String day, String time) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('appointmentDay', day);
    await prefs.setString('appointmentTime', time);
    hasAppointment.value = true; // Update the observable
  }

  Future<void> cancelAppointment() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('appointmentDay');
    await prefs.remove('appointmentTime');
    hasAppointment.value = false; // Update the observable
  }

  Rx<AppointmentsModel> appointmentsModelObj;
}

