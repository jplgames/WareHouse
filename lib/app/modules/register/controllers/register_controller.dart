// ignore_for_file: unused_field
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/provider/db_provider.dart';
import '../../../data/service/setting_service.dart';
import '../user.dart';

class RegisterController extends GetxController {
  final SettingsService settingsService;

  RegisterController({required this.settingsService});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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

  void register() async {
    print('LOG ${fullnameController.text}');
    final bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();

    isLoaded.value = true;
    await DataBaseProvider.instance.register(
      User(
          fullName: fullnameController.text,
          userName: usernameController.text,
          password: passwordController.text),
    );

    settingsService.userAdded([fullnameController.text, usernameController.text]);
    isLoaded.value = false;
    Get.offNamed('/login');
  }

  @override
  void dispose() {
    fullnameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
