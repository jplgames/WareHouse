import 'package:flutter/material.dart';

import 'colors.dart';

class TextStyles {
  // Bold
  static TextStyle bold24 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    fontFamily: 'Poppins',
  );

  static final bold24White = bold24.copyWith(color: white);

  // Semi Bold
  static TextStyle semiBold48 = const TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
  );
  static final semiBold48WhiteE5 = semiBold48.copyWith(color: whiteE5);

  // Medium
  static TextStyle medium25 = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
  );

  static final medium25Black = medium25.copyWith(color: black);

  // Normal
  static TextStyle normal16 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );

  static final normal16Black = normal16.copyWith(color: black);
  static final normal16White = normal16.copyWith(color: white);
  static final normal16Green = normal16.copyWith(color: buttonGreen);
  static final normal16Red = normal16.copyWith(color: buttonRed);

  // Normal
  static TextStyle normal12 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );

  static final normal12White = normal12.copyWith(color: white);
  static final normal12Black = normal12.copyWith(color: black);
  static final normal12Green = normal12.copyWith(color: buttonGreen);
  static final normal12Red = normal12.copyWith(color: buttonRed);
}
