import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:myapp/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  // ignore: unused_field
  final HomeController _homeController = HomeController();

  HomeView({super.key});
  
  @override
  Widget build(BuildContext context) {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2973585718.
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
