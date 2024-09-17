import 'package:flutter/material.dart';
import '../values/colors.dart';

class CardLayoutTheme extends StatelessWidget {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2857498461.
  final String title;
  final String image;

// Suggested code may be subject to a license. Learn more: ~LicenseLog:1165237298.
  const CardLayoutTheme({super.key, required this.title, this.image = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 25,
            height: 25,
          ),
          Text(title),
        ],
      ),
    );
  }
}
