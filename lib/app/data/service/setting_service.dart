import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService extends GetxService {
  late SharedPreferences _preferences;

  final isUserAdded = 0.obs;
  final userList = [].obs;
  final storecnpj = ''.obs;

  Future<SettingsService> init() async {
    _preferences = await SharedPreferences.getInstance();
    isUserAdded.value = (_preferences.getInt('isUserAdded') ?? 0);
    storecnpj.value = _preferences.getString('storecnpj')!;
    return this;
  }

  userAdded(user) {
    _preferences.setInt('isUserAdded', 1);
    _preferences.setStringList('user', user);
    userList.value = user;
    isUserAdded.value = _preferences.getInt("isUserAdded")!;
  }

  storeAdded(store) {
    _preferences.setString('storecnpj', store);
    storecnpj.value = _preferences.getString('storecnpj')!;
  }
}
