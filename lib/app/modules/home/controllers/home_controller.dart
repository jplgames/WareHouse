import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../data/service/setting_service.dart';

class HomeController extends GetxController {
  SettingsService settingsService;

  HomeController({required this.settingsService}) {
    settingsService.init();
  }

  final _instance = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  void init() async {
    // ignore: unnecessary_null_comparison
    if (settingsService.storecnpj.value != null ||
        settingsService.storecnpj.value != '') {
      log('Logado na Loja ${settingsService.storecnpj.value}');
    }
    // ignore: unnecessary_null_comparison
    if (settingsService.storecnpj.value == null) {
      final String cnpj = settingsService.storecnpj.value;
      if (cnpj.toString().length < 3) {
        log('hello world');
        try {
          log('Buscando CNPJ...');
          if (_auth.currentUser != null) {
            final snapshot = await _instance
                .collection('users')
                .doc(_auth.currentUser!.uid)
                .get();
            if (snapshot.exists) {
              Map<String, dynamic> data =
                  snapshot.data() as Map<String, dynamic>;
              String cnpj = data['cnpj'];
              log('CNPJ encontrado...');
              // ignore: unnecessary_null_comparison
              if (cnpj != null || cnpj != '') {
                settingsService.storeAdded(cnpj);
              }
            }
          }
        } catch (e) {
          log('Erro: $e');
        }
      }
    }
  }

  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance
          .signOut()
          .then((value) => Get.offNamed('/login'));
      settingsService.storecnpj('');
    } catch (e) {
      Get.snackbar('[ERRO]', 'Algo deu errado :(');
      log('Erro: $e');
    }
  }
}
