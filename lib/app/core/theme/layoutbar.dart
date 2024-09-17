import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutBar extends StatelessWidget {
  const LayoutBar({super.key, required this.body, required this.route})
      : super();
  final Widget body;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.offNamed(route);
            },
            icon: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? Colors.white.withOpacity(0.03)
                      : Colors.black.withOpacity(0.03),
                  shape: BoxShape.circle),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: context.isDarkMode ? Colors.white : Colors.black,
              ),
            )),
      ),
      body: body,
    );
  }
}
