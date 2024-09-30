import 'package:get/get.dart';
import '../controllers/store_controller.dart';
import '../../../data/service/setting_service.dart';

class StoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreController>(
        () => StoreController(settingsService: Get.find<SettingsService>()));
  }
}
