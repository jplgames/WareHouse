import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  // ignore: unused_field
  final HomeController _homeController = HomeController();
  final email = FirebaseAuth.instance.currentUser?.email;

  @override
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    log('Logado com email: $email');
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        // Usuário está logado, redirecionar para a tela principal
        Get.toNamed('/home');
      } else {
        // Usuário não está logado, redirecionar para a tela de login
        Get.toNamed('/login');
      }
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Hello World',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .signOut()
                      .then((value) => Get.offNamed('/login'));
                },
                child: const Text('LogOut',
                    style: TextStyle(color: Color(0x9CFF00BF))))
          ]),
        ));
  }
}
