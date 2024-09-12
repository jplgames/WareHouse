import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/button_theme.dart';
import '../controllers/register_controller.dart';
import '../../../core/theme/imput_theme.dart';
import '../../../core/values/colors.dart';
import '../../../core/theme/layout_theme.dart';

// ignore: must_be_immutable
class RegisterView extends GetView {
  RegisterView({super.key});

  final RegisterController _registerController = Get.find<RegisterController>();

  // ignore: non_constant_identifier_names
  Stringteste() {
    var teste = 'teste';
    return teste;
  }

  @override
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

  Column mainSection() {
    // ignore: prefer_const_constructors
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
            key: _registerController.formKey,
            child: Column(
              children: [
                fullNameForm(),
                userNameForm(),
                passwordForm(),
                confirmPasswordForm(),
              ],
            )),
        const SizedBox(height: 20),
        Obx(() => _registerController.isLoaded.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SubmitButton(
                onTap: () {
                  _registerController.register();
                },
                title: 'Registre-se',
                buttonColor: const Color.fromARGB(101, 124, 90, 235),
              )),
      ],
    );
  }

  CustomInputField fullNameForm() {
    return CustomInputField(
      hint: 'Nome Completo',
      controller: _registerController.fullnameController,
      validator: (fullname) {
        return _registerController.fullNameValidation(fullname);
      },
      onSaved: (fullname) {
        _registerController.fullnameController.text = fullname;
      },
    );
  }

  CustomInputField passwordForm() {
    return CustomInputField(
      hint: 'Senha',
      controller: _registerController.passwordController,
      validator: (password) {
        return _registerController.passwordValidation(password);
      },
      onSaved: (password) {
        _registerController.passwordController.text = password;
      },
      isHidden: true,
    );
  }

  CustomInputField userNameForm() {
    return CustomInputField(
      hint: 'Nome de Usuario',
      controller: _registerController.usernameController,
      validator: (username) {
        return _registerController.userNameValidation(username);
      },
      onSaved: (username) {
        _registerController.usernameController.text = username;
      },
    );
  }

  CustomInputField confirmPasswordForm() {
    return CustomInputField(
      hint: 'Confirmar Senha',
      controller: _registerController.confirmPasswordController,
      validator: (password) {
        return _registerController.confirmPasswordValidation(password);
      },
      onSaved: (password) {
        _registerController.confirmPasswordController.text = password;
      },
      isHidden: true,
    );
  }
}
