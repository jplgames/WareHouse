import 'package:get/get.dart';
import '../../../data/service/setting_service.dart';

class SplashController extends GetxController {
  final SettingsService settingsService;

  SplashController({required this.settingsService});

  void navigateUser() {
    Get.offNamed('/login');
  }
}
