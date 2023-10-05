import '../../../core/app_export.dart';

/// This class is used in the [jenobarbershop_item_widget] screen.
class JenobarbershopItemModel {
  JenobarbershopItemModel({
    this.shopName,
    this.shopAddress,
    this.id,
  }) {
    shopName = shopName ?? Rx("Jeno’s Barbershop");
    shopAddress = shopAddress ?? Rx("George St, Tel aviv");
    id = id ?? Rx("");
  }

  Rx<String>? shopName;

  Rx<String>? shopAddress;

  Rx<String>? id;
}

