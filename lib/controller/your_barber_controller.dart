import 'package:barber_app1/core/app_export.dart';
import 'package:barber_app1/models/your_barber_model.dart';
import 'package:barber_app1/widgets/screen_nine.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourBarberController extends GetxController {
  // For the model object
  Rx<YourBarberModel> yourBarberModelObj = YourBarberModel().obs;

  // For tracking the active dropdown
  RxString activeDropdown = ''.obs;

  // Observable variable to keep track of the selected day
  RxString selectedDay = ''.obs;

  RxString selectedTime = ''.obs;


RxString currentDropdownType = ''.obs;

RxInt notificationCount = 0.obs;

void incrementNotification() {
    notificationCount.value++;
  }

 void resetSelections() {
    selectedDay.value = '';
    selectedTime.value = '';
  }

  void storeAppointment(String day, String time) async{
  // Store the day and time in a persistent storage
  // For example, using shared preferences:
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('appointmentDay', day);
  await prefs.setString('appointmentTime', time);
}


void toggleDropDown(String dropdownType) {
    currentDropdownType.value = dropdownType;
    if (activeDropdown.value == dropdownType) {
        activeDropdown.value = '';  // Close the dropdown
    } else {
        activeDropdown.value = dropdownType;  // Open the specified dropdown
    }
}


  // void toggleDaySelection() {
  //     // activeDropdown.value = "${activeDropdown.value}_time";  // Open the time selection

  //   if (activeDropdown.value.endsWith("_day")) {

  //     activeDropdown.value = '';  // Close the day selection
  //   } else {

  //     activeDropdown.value = "${activeDropdown.value}_day";  // Open the day selection for the specified dropdown
  //   }
  // }

void toggleDaySelection() {
    if (activeDropdown.value == "${currentDropdownType.value}_day") {
        activeDropdown.value = "${currentDropdownType.value}_time";  // Transition to time selection
    } else {
        activeDropdown.value = "${currentDropdownType.value}_day";  // Open the day selection for the specified dropdown
    }
}

// void setSelectedTime(String time) {
//     selectedTime.value = time;
//     // Navigate to ScreenNine after time is selected.
//     Get.to(() => ScreenNine(
//       controller: this,
//       title: "Your Title",
//       price: "Your Price",
//       dropdownType: "Your DropdownType",
//     ));
//   }



    void toggleTimeSelection() {
    if (activeDropdown.value.endsWith("_time")) {
      activeDropdown.value = '';  // Close the day selection
    } else {
      activeDropdown.value = "${activeDropdown.value}_time";  // Open the day selection for the specified dropdown
    }
  }



setSelectedDay(String day) {
  selectedDay.value = day;
}

setSelectedTime(String time) {
  selectedTime.value = time;
    // print("Setting time to: $time");

}


  // Handle the dropdown selection
  void onSelected(String value) {
    // Handle the selection logic here
  }

  // Handle the second dropdown selection (if needed)
  void onSelected1(String value) {
    // Handle the selection logic here
  }
}



// import 'package:barber_app1/core/app_export.dart';
// import 'package:barber_app1/models/your_barber_model.dart';

// class YourBarberController extends GetxController {
//   // For the model object
//   Rx<YourBarberModel> yourBarberModelObj = YourBarberModel().obs;

//   // For tracking the active dropdown
//   RxString activeDropdown = ''.obs;

//   void toggleDropDown(String dropdownType) {
//     if (activeDropdown.value == dropdownType) {
//       activeDropdown.value = '';  // Close the dropdown
//     } else {
//       activeDropdown.value = dropdownType;  // Open the specified dropdown
//     }
//   }

//   void toggleDaySelection() {
//     if (activeDropdown.value.endsWith("_day")) {
//       activeDropdown.value = '';  // Close the day selection
//     } else {
//       activeDropdown.value = "${activeDropdown.value}_day";  // Open the day selection for the specified dropdown
//     }
//   }

//   // Handle the dropdown selection
//   void onSelected(String value) {
//     // Handle the selection logic here
//   }

//   // Handle the second dropdown selection (if needed)
//   void onSelected1(String value) {
//     // Handle the selection logic here
//   }
// }









  // void toggleDropDown(String dropdownType) {
  //   if (dropdownType == "haircut") {
  //     isDropDownOpen.value = !isDropDownOpen.value;
  //     isTimeSelectionOpen.value = false; // Close time selection if it's open
  //   } else if (dropdownType == "beard") {
  //     isBeardDropDownOpen.value = !isBeardDropDownOpen.value;
  //     isTimeSelectionOpen.value = false; // Close time selection if it's open
  //   } else if (dropdownType == "time") {
  //     isTimeSelectionOpen.value = !isTimeSelectionOpen.value;
  //     isDropDownOpen.value = false; // Close other dropdowns if they're open
  //     isBeardDropDownOpen.value = false;
  //   }
  // }


// void toggleDropDown(String type) {
//   if (type == "haircut") {
//     if (isDropDownOpen.value) {
//       isDropDownOpen.value = false;
//     } else {
//       isDropDownOpen.value = true;
//       isBeardDropDownOpen.value = false;
//     }
//   } else if (type == "beard") {
//     if (isBeardDropDownOpen.value) {
//       isBeardDropDownOpen.value = false;
//     } else {
//       isBeardDropDownOpen.value = true;
//       isDropDownOpen.value = false;
//     }
//   }
// }
