import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/layoutbar.dart';
import '../../../core/theme/button_theme.dart';
import '../controllers/register_controller.dart';
import '../../../core/theme/imput_theme.dart';

// ignore: must_be_immutable
class RegisterView extends GetView {
  RegisterView({super.key});

  final RegisterController _registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBar(
      route: '/login',
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
        const SizedBox(height: 10),
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
        SingleChildScrollView(
          child: Column(
            children: [
              Form(
                  key: _registerController.formKey,
                  child: Column(
                    children: [
                      _fullNameForm(),
                      _idForm(),
                      _userNameForm(),
                      _emailForm(),
                      _passwordForm(),
                      _confirmPasswordForm(),
                    ],
                  ))
            ],
          ),
        ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Ja tem uma conta? '),
            TextButton(
                onPressed: () {
                  Get.toNamed('/login');
                },
                child: const Text('Login'))
          ],
        )
      ],
    );
  }

  CustomInputField _fullNameForm() {
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

  CustomInputField _passwordForm() {
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

  CustomInputField _userNameForm() {
    return CustomInputField(
      hint: 'Nome da empresa',
      controller: _registerController.usernameController,
      validator: (username) {
        return _registerController.userNameValidation(username);
      },
      onSaved: (username) {
        _registerController.usernameController.text = username;
      },
    );
  }

  CustomInputField _confirmPasswordForm() {
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

  CustomInputField _emailForm() {
    return CustomInputField(
      hint: 'E-mail',
      controller: _registerController.emailController,
      validator: (email) {
        return _registerController.emailValidation(email);
      },
      onSaved: (email) {
        _registerController.emailController.text = email;
      },
    );
  }

  CustomInputField _idForm() {
    return CustomInputField(
      hint: 'CPF/CNPJ',
      controller: _registerController.idController,
      validator: (id) {
        return _registerController.idValidation(id);
      },
      onSaved: (id) {
        _registerController.idController.text = id;
      },
    );
  }
}
