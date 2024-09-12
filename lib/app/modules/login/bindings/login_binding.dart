import 'package:get/get.dart';

import '../../../data/service/setting_service.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        settingsService: Get.find<SettingsService>()
      ),
    );
  }
}
