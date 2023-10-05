// // import '../../../core/app_export.dart';
// // import 'package:barber_app1/data/models/selectionPopupModel/selection_popup_model.dart';
// // import 'package:barber_app1/models/haircut_select_model.dart';

// // /// This class defines the variables used in the [your_barber_screen],
// // /// and is typically used to hold data that is passed between different parts of the application.
// // class HaircutModel {
// //   // RxList<SelectdayItemModel> selectdayItemList = RxList<SelectdayItemModel>();
// //   Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
// //     SelectionPopupModel(
// //       id: 1,
// //       title: "Item One",
// //       isSelected: true,
// //     ),
// //     SelectionPopupModel(
// //       id: 2,
// //       title: "Item Two",
// //     ),
// //     SelectionPopupModel(
// //       id: 3,
// //       title: "Item Three",
// //     )
// //   ]);

// //   Rx<List<SelectionPopupModel>> dropdownItemList1 = Rx([
// //     SelectionPopupModel(
// //       id: 1,
// //       title: "Item One",
// //       isSelected: true,
// //     ),
// //     SelectionPopupModel(
// //       id: 2,
// //       title: "Item Two",
// //     ),
// //     SelectionPopupModel(
// //       id: 3,
// //       title: "Item Three",
// //     )
// //   ]);
// // }


// /// This class defines the variables used in the [screen_nine_screen],
// /// and is typically used to hold data that is passed between different parts of the application.
// // class ScreenNineModel {
// //   Rx<List<SelectdayItemModel>> selectdayItemList =
// //       Rx(List.generate(3, (index) => SelectdayItemModel()));
// // }

// import '../../../core/app_export.dart';

// class ScreenNineModel {
//   Rx<List<SelectdayItemModel>> selectdayItemList = Rx(
//     List.generate(1, (index) => SelectdayItemModel()), // Only one "Select Day" button
//   );
// }



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
// }



