import 'package:get/get.dart';
import '../../../data/service/setting_service.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(settingsService: Get.find<SettingsService>()),
    );
  }
}
