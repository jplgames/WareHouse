import 'package:get/get.dart';

import 'package:warehouse/app/data/service/setting_service.dart';
import 'package:warehouse/app/modules/splash/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsService());
    Get.lazyPut<SplashController>(
      () => SplashController(
        settingsService: Get.find<SettingsService>(),
      ),
    );
  }
}
