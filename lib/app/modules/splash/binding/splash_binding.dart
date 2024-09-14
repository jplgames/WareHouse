import 'package:get/get.dart';

import '../../../data/service/setting_service.dart';
import '../controllers/splash_controller.dart';



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
