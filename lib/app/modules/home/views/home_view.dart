import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeus.go/app/core/theme/layoutbar.dart';
import 'package:zeus.go/app/core/theme/card_theme.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final _homeController = Get.find<HomeController>();
  final email = FirebaseAuth.instance.currentUser?.email;

  @override
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    _homeController.init();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        // Usuário está logado, redirecionar para a tela principal
        Get.toNamed('/home');
      } else {
        // Usuário não está logado, redirecionar para a tela de login
        Get.toNamed('/login');
      }
    });

    return LayoutBar(
      route: '/home',
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            const Text(
              'Warehouse Manager',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 70),
            SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.offNamed('/products');
                    },
                    child: const CardLayoutTheme(
                      title:
                          'Produtos', //AppLocalizations.of(context)!.products,
                      image: 'assets/images/4396761.png',
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Get.offNamed('/clients');
                    },
                    child: const CardLayoutTheme(
                      title: 'Clientes',
                      image: 'assets/images/4396761.png',
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.offNamed('/store');
              },
              child: const CardLayoutTheme(
                title: 'Loja', //AppLocalizations.of(context)!.products,
                image: 'assets/images/4396761.png',
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
                onPressed: () {
                  _homeController.logOut();
                  log('Logout');
                },
                child: const Text('LogOut',
                    style: TextStyle(color: Color(0x9CFF00BF))))
          ]),
        ),
      ),
    );
  }
}
