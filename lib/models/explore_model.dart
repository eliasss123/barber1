// import '../../../core/app_export.dart';
// import 'userprofile_item_model.dart';

// /// This class defines the variables used in the [explore_page],
// /// and is typically used to hold data that is passed between different parts of the application.
// class ExploreModel {
//   Rx<List<UserprofileItemModel>> userprofileItemList =
//       Rx(List.generate(3, (index) => UserprofileItemModel()));
// }

import '../../../core/app_export.dart';
import 'userprofile_item_model.dart';

class ExploreModel {
  RxList<UserprofileItemModel> userprofileItemList = 
      List.generate(5, (index) => UserprofileItemModel()).obs;
}
