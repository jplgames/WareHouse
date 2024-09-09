import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/core/theme/layout_theme.dart';
import 'package:myapp/app/core/values/strings.dart';
import 'package:myapp/app/modules/splash/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  // ignore: unused_field
  final SplashController _splashController = Get.find<SplashController>();

  SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), _splashController.navigateUser);
    return BlankLayout(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/4396761.png",
            height: 120,
          ),
          const SizedBox(height: 20),
          Text("Warehouse Manager", style: TextStyles.medium25)
        ],
      ),
    );
  }
}
