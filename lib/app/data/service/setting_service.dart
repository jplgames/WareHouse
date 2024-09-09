import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService extends GetxService {
  // ignore: unused_field
  late SharedPreferences _preferences;

  Future<SettingsService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }
}