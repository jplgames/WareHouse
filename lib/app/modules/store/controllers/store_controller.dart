import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../storemodel.dart';
import '../../../data/service/setting_service.dart';

class StoreController extends GetxController {
  final storeKey = GlobalKey<FormState>();
  final SettingsService settingsService;

  TextEditingController storeNameController = TextEditingController();
  TextEditingController cnpjNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  StoreController({required this.settingsService}) {
    settingsService.init();
  }

  final _instance = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  void onInit() async {
    super.onInit();
    final String? cnpj = settingsService.storecnpj.value;
    if (cnpj == null || cnpj == '') {
      log('hello world');

      try {
        final snapshot = await _instance
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .get();
        if (snapshot.exists) {
          Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
          String cnpj = data['cnpj'];
          log('CNPJ encontrado...');
          // ignore: unnecessary_null_comparison
          if (cnpj != null || cnpj != '') {
            settingsService.storeAdded(cnpj);
          }
        }
      } catch (e) {
        log('Erro: $e');
      }
    }
  }

  storeNameValidation(d) {
    if (d.isEmpty) {
      return 'Campo obrigatorio';
    } else if (d.length < 3) {
      return 'Nome da loja deve conter no minimo 3 caracteres';
    }
    return null;
  }

  cnpjValidation(d) {
    return null;
  }

  addressValidation(d) {
    if (d.isEmpty) {
      return 'Campo obrigatorio';
    }
    return null;
  }

  register() async {
    final store = StoreModel(
            name: storeNameController.text,
            address: addressController.text,
            cnpj: cnpjNumberController.text)
        .toJson();

    final bool isValid = storeKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    log('Store added: ${settingsService.storecnpj}');
    storeKey.currentState!.save();
    try {
      _instance.collection('company').doc(cnpjNumberController.text).set(store);
      _instance.collection('users').doc(_auth.currentUser!.uid).update({
        'store': cnpjNumberController.text,
      });
      settingsService.storeAdded(cnpjNumberController.text);      
      Get.snackbar('Sucesso', 'Loja cadastrada com sucesso');
      Get.toNamed('/home');
    } catch (e) {
      Get.snackbar('[ERRO]', e.toString());
    }
  }

  @override
  void dispose() {
    storeNameController.dispose();
    cnpjNumberController.dispose();
    addressController.dispose();
    super.dispose();
  }
}
