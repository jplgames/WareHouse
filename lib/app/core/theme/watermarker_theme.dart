import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class WatermarkWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 16,
      child: Text(
        '0.0.1b',
        style: TextStyle(
          color: context.isDarkMode
              ? Colors.grey
              : Color.fromARGB(255, 68, 68, 68),
          fontSize: 12,
        ),
      ),
    );
  }
}
