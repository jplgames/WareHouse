// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/button_theme.dart';
import '../../../core/theme/imput_theme.dart';
import '../../../core/theme/layout_theme.dart';
import '../../../core/values/colors.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final LoginController _loginController = Get.find<LoginController>();

  LoginView({super.key});

  Widget build(BuildContext context) {
    return MainLayout(
      appbar: AppBar(
        toolbarHeight: 0,
        shadowColor: transparent,
        backgroundColor: transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          child: mainSection(),
        ),
      ),
    );
  }

  mainSection() {
    return Column(
      // Se der BO tira o const :)
      children: [
        const SizedBox(height: 70),
        Image.asset(
          'assets/images/4396761.png',
          width: 60,
          height: 60,
        ),
        const SizedBox(height: 10),
        const Text(
          'Seja Bem-vindo(a) ao Warehouse Manager',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 40),
        Form(
            child: Column(
          children: [
            emailForm(),
            passwordForm(),
          ],
        )),
        const SizedBox(height: 20),
        Obx(() => _loginController.isLoaded.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SubmitButton(
                onTap: () {
                  _loginController.login();
                },
                title: 'Login',
                buttonColor: const Color.fromARGB(101, 124, 90, 235),
              )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Não tem uma conta? '),
            TextButton(
                onPressed: () {
                  Get.toNamed('/register');
                },
                child: const Text('Registre-se'))
          ],
        )
      ],
    );
  }

  CustomInputField emailForm() {
    return CustomInputField(
      hint: 'E-mail',
      controller: _loginController.emailController,
      validator: (email) {
        return _loginController.emailValidation(email);
      },
      onSaved: (email) {
        _loginController.emailController.text = email;
      },
    );
  }

  CustomInputField passwordForm() {
    return CustomInputField(
      hint: 'Senha',
      controller: _loginController.passwordController,
      validator: (password) {
        return _loginController.passwordValidation(password);
      },
      onSaved: (password) {
        _loginController.passwordController.text = password;
      },
      isHidden: true,
    );
  }
}
