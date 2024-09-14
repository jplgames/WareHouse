// ignore_for_file: unused_field
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/service/setting_service.dart';

class RegisterController extends GetxController {
  final SettingsService settingsService;
  final _auth = FirebaseAuth.instance;

  RegisterController({required this.settingsService}) {
    settingsService.init();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RxBool isLoaded = false.obs;

  String? fullNameValidation(String fullname) {
    if (fullname.isEmpty) {
      return 'Campo obrigatorio';
    }
    return null;
  }

  String? userNameValidation(String username) {
    if (username.isEmpty) {
      return 'Campo obrigatorio';
    } else if (!GetUtils.isUsername(username)) {
      return 'Nome de usuario invalido';
    }
    return null;
  }

  String? passwordValidation(String password) {
    if (password.isEmpty) {
      return 'Campo obrigatorio';
    }
    return null;
  }

  String? confirmPasswordValidation(String password) {
    if (password.isEmpty) {
      return 'Campo obrigatorio';
    } else if (password.length < 6) {
      return 'Senha deve conter no minimo 6 caracteres';
    } else if (password != confirmPasswordController.text) {
      return 'As senhas nao sao iguais';
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

  Future<void> register() async {
    log('[LOG] Cadastrando usuario: ${fullnameController.text}');
    final bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();

    isLoaded.value = false;

    try {
      if (isLoaded.value) {
        // ignore: unused_local_variable
        final UserCredential = await _auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        // ignore: unused_local_variable
        final UserCredential = await _auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      }

      log('Usuario registrado com sucesso: ${fullnameController.text}');
      settingsService
          .userAdded([fullnameController.text, usernameController.text]);
      isLoaded.value = true;
      Get.offNamed('/login');
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          log('Email ja cadastrado');
        } else if (e.code == 'invalid-email') {
          log('Email invalido');
        }
      } else {
        log('Erro ao registrar usuário: $e');
      }
    }
  }

  @override
  void dispose() {
    fullnameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
