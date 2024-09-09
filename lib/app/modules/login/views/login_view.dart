// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/core/theme/layout_theme.dart';

class LoginView extends GetView {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlankLayout(
      body: Center(
        child: Text("Login"),
      ),
    );
  }
}
