import '../../../core/app_export.dart';

// /// This class is used in the [selectday_item_widget] screen.
// /// /// This class is used in the [selectTime_item_widget] screen.
// /// 
// class SelectdayItemModel {
//   SelectdayItemModel({
//     this.selectedDay,
//     this.id,
//   }) {
    
//     selectedDay = selectedDay ?? Rx("Select Day");
//     id = id ?? Rx("");
//   }

//   Rx<String>? selectedDay;

//   Rx<String>? id;

//   bool _isSelected = false;

//   bool get isSelected => _isSelected;

//   set isSelected(bool value) {
//     _isSelected = value;
//   }

// }

// class ScreenNineModel {
//   Rx<List<SelectdayItemModel>> selectdayItemList = Rx(
//     List.generate(1, (index) => SelectdayItemModel()), // Only one "Select Day" button
//   );
// }


// // class SelecttimeItemModel {
// //   SelecttimeItemModel({
// //     this.selectedTime,
// //     this.id,
// //   }) {
// //     selectedTime = selectedTime ?? Rx("Select Time");
// //     id = id ?? Rx("");
// //   }

// //   Rx<String>? selectedTime;

// //   Rx<String>? id;
// // }

// /// This class defines the variables used in the [screen_nine_screen],
// /// and is typically used to hold data that is passed between different parts of the application.
// // class ScreenNineModel {
// //   Rx<List<SelectdayItemModel>> selectdayItemList =
// //       Rx(List.generate(3, (index) => SelectdayItemModel()));
// // }

class YourBarberModel {
    String? selectedDay;
  String? selectedTime;
  // Dropdown items for the barber selection
  // Rx<List<String>> dropdownItemList = Rx<List<String>>([]);

  // // Dropdown items for the bottom selection
  // Rx<List<String>> dropdownItemList1 = Rx<List<String>>([]);

    Rx<List<SelectionPopupModel>> dropdownItemList = Rx<List<SelectionPopupModel>>([]);
  Rx<List<SelectionPopupModel>> dropdownItemList1 = Rx<List<SelectionPopupModel>>([]);

  // List of items for the "Select Day" dropdown
  Rx<List<SelectdayItemModel>> selectdayItemList = Rx<List<SelectdayItemModel>>([]);

  // You can add more properties as needed for other data on the screen
}

class SelectdayItemModel {
  SelectdayItemModel({
    this.selectedDay,
    this.selectedTime,
    this.id,
    bool? isConfirmed,
  }) {
    selectedDay = selectedDay ?? Rx("Select Day");
    selectedTime = selectedTime ?? Rx("Select Time");
    id = id ?? Rx("");
    this.isConfirmed.value = isConfirmed ?? false;
  }

  Rx<String>? selectedDay;
  Rx<String>? selectedTime;
  Rx<String>? id;
  RxBool isConfirmed = RxBool(false); // Initialized with a default value
}

// class SelecttimeItemModel {
//   SelecttimeItemModel({
//     this.selectedTime,
//     this.id,
//   }) {
//     selectedTime = selectedTime ?? Rx("Select Time");
//     id = id ?? Rx("");
//   }

//   Rx<String>? selectedTime;

//   Rx<String>? id;
// }

