import 'package:flutter/material.dart';
import 'package:warehouse/app/core/values/strings.dart';

import '../values/colors.dart';

class SubmitButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color buttonColor;
  const SubmitButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: buttonColor,
        ),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}

class OnBoardingButton extends StatelessWidget {
  final Function onTap;

  const OnBoardingButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Center(
        child: Container(
          width: 160,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            // border: Border.all(color: Colors.black),
            gradient: const LinearGradient(
              colors: [whiteC4Start, whiteC4End],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  "Next",
                  textAlign: TextAlign.center,
                  style: TextStyles.medium25Black,
                ),
              ),
              Icon(Icons.navigate_next),
              SizedBox(width: 10)
            ],
          ),
        ),
      ),
    );
  }
}
