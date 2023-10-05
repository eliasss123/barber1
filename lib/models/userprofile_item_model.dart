import '../../../core/app_export.dart';

/// This class is used in the [userprofile_item_widget] screen.
class UserprofileItemModel {
  UserprofileItemModel({
    this.userName,
    this.userLocation,
    this.id,
  }) {
    userName = userName ?? Rx("Elias Miilya ");
    userLocation = userLocation ?? Rx("Mar Elias St, Haifa");
    id = id ?? Rx("");
  }

  Rx<String>? userName;

  Rx<String>? userLocation;

  Rx<String>? id;
}
