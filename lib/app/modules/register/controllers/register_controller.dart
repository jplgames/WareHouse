// ignore_for_file: unused_field
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/service/setting_service.dart';
import '../user.dart';

//PUB.DEV pacotes

class RegisterController extends GetxController {
  final SettingsService settingsService;
  final _auth = FirebaseAuth.instance;
  final _instance = FirebaseFirestore.instance;

  RegisterController({required this.settingsService}) {
    settingsService.init();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
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

  String? idValidation(String id) {
    if (id.isEmpty) {
      return 'Campo obrigatorio';
    } else if (!CPFValidator.isValid(id) && !CNPJValidator.isValid(id)) {
      return 'Credencial invalida';
    }
    return null;
  }

  Future<void> register() async {
    log('[CONTROLLER] Cadastrando usuario: ${fullnameController.text}');
    final bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();

    isLoaded = false.obs;
    try {
      if (isLoaded.value) {
        log('[LOG] Logando usuario');
        // ignore: unused_local_variable
        await _auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        log('[LOG] Registrando usuario: ${fullnameController.text}');
        // ignore: unused_local_variable
        await _auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        // ignore: no_leading_underscores_for_local_identifiers
        final _userUid = _auth.currentUser!.uid;

        var _user = UserModel(
          fullName: fullnameController.text,
          userName: usernameController.text,
          identifier: idController.text,
        ).toJson();

        // ignore: unnecessary_null_comparison
        if (_userUid != null) {
          try {
            await _instance.collection('users').doc(_userUid).set(_user);
            log('Usuario registrado com sucesso: ${fullnameController.text}');
          } catch (e) {
            log('Erro ao cadastrar usuario: $e');
          }
        }
      }

      settingsService
          .userAdded([fullnameController.text, usernameController.text]);
      isLoaded.value = true;

      FirebaseAuth.instance.authStateChanges().listen((user) {
        if (user != null) {
          // Usuário está logado, redirecionar para a tela principal
          Get.toNamed('/home');
          isLoaded = false.obs;
        } else {
          // Usuário não está logado, redirecionar para a tela de login
          Get.toNamed('/login');
          isLoaded = false.obs;
        }
      });
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          Get.snackbar('[ERRO]', 'Email ja cadastrado');
        } else if (e.code == 'invalid-email') {
          Get.snackbar('[ERRO]', 'Email Invalido');
        } else if (e.code == 'weak-password') {
          Get.snackbar('[ERRO]', 'Senha fraca');
        }
      } else {
        log('Erro ao registrar usuário: $e');
      }
    }
    usernameController.clear();
    fullnameController.clear();
    passwordController.clear();
    emailController.clear();
    confirmPasswordController.clear();
    idController.clear();
  }

  @override
  void dispose() {
    fullnameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    idController.dispose();
    emailController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
