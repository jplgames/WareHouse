// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/layout_theme.dart';
import '../../../core/values/strings.dart';
import '../controllers/login_controller.dart';


class LoginView extends GetView<LoginController> {

  final LoginController _loginController = Get.find<LoginController>();

  void navegateUser() {
    _loginController.navegateUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlankLayout(
      body: Center(
        child: ElevatedButton(
          onPressed: () => {navegateUser()}, 
            child: Text('Registro', style: TextStyles.normal16,)),
        
      ),
    );
  }
}
