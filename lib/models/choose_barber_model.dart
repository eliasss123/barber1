import '../../../core/app_export.dart';
import 'jenobarbershop_item_model.dart';

/// This class defines the variables used in the [choose_barber_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ChooseBarberModel {
  Rx<List<JenobarbershopItemModel>> jenobarbershopItemList =
      Rx(List.generate(7, (index) => JenobarbershopItemModel()));
}
