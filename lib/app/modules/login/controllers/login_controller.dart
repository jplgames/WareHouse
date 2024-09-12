import 'package:get/get.dart';

import '../../../data/service/setting_service.dart';

class LoginController extends GetxController {
  final SettingsService settingsService;

  LoginController({required this.settingsService});

  void navegateUser() {
    Get.offNamed('/register');
  }
}
