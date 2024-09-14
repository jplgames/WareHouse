// ignore_for_file: unused_local_variable, unused_field

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../modules/register/user.dart';
import '../service/setting_service.dart';

class DataBaseProvider {
  FirebaseFirestore instance = FirebaseFirestore.instance;

  final SettingsService _settingsService = Get.put(SettingsService());
  String userTableName = "users";

  Future<void> register(User user) async {
    try {
      final docRef = await instance.collection('users').add(user.toJson());
      user.id = docRef.id as int?; // Atribui o ID do documento ao usuário
    } catch (e) {
      print('Erro ao registrar usuário: $e');
    }
  }
}
