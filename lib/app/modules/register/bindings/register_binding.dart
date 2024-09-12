import 'package:get/get.dart';
import '../../../data/service/setting_service.dart';
import '../../../modules/register/controllers/register_controller.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(
        settingsService: Get.find<SettingsService>()
      ));
  }
}