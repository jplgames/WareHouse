import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/service/setting_service.dart';

class LoginController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final SettingsService settingsService;
  final _auth = FirebaseAuth.instance;

  LoginController({required this.settingsService});

  RxBool isLoaded = false.obs;

  void login() async {
    try {
      isLoaded = true.obs;
      await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      log('Usuario Logado com sucesso');
      isLoaded = false.obs;
      Get.offNamed('/home');
    } on FirebaseAuthException catch (e) {
      isLoaded = false.obs;
      switch (e.message) {
        case 'invalid-credential':
          Get.snackbar('WM Erro', 'Usuario não encontrado');
          break;
        case 'wrong-password':
          Get.snackbar('WM Erro', 'Senha incorreta');
          break;
        default:
          Get.snackbar('WM Erro', 'Erro ao logar');
      }
    }
  }

  String? passwordValidation(String password) {
    if (password.isEmpty) {
      return 'Campo obrigatorio';
    }
    return null;
  }

  String? emailValidation(String email) {
    if (email.isEmpty) {
      return 'Campo obrigatorio';
    } else if (email.length < 6) {
      return 'Senha deve conter no minimo 6 caracteres';
    } else if (!GetUtils.isEmail(email)) {
      return 'Email invalido';
    }
    return null;
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
