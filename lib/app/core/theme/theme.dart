import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff562fc4),
      surfaceTint: Color(0xff6541d4),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff7c5aeb),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff625592),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd1c3ff),
      onSecondaryContainer: Color(0xff3d306a),
      tertiary: Color(0xff91157b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffbe42a3),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffdf7ff),
      onSurface: Color(0xff1c1a23),
      onSurfaceVariant: Color(0xff484554),
      outline: Color(0xff797586),
      outlineVariant: Color(0xffcac3d7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f38),
      inversePrimary: Color(0xffccbdff),
      primaryFixed: Color(0xffe7deff),
      onPrimaryFixed: Color(0xff1f0060),
      primaryFixedDim: Color(0xffccbdff),
      onPrimaryFixedVariant: Color(0xff4d21bb),
      secondaryFixed: Color(0xffe7deff),
      onSecondaryFixed: Color(0xff1e0f4b),
      secondaryFixedDim: Color(0xffccbdff),
      onSecondaryFixedVariant: Color(0xff4a3e79),
      tertiaryFixed: Color(0xffffd7ee),
      onTertiaryFixed: Color(0xff3a0030),
      tertiaryFixedDim: Color(0xffffade4),
      onTertiaryFixedVariant: Color(0xff850371),
      surfaceDim: Color(0xffded8e4),
      surfaceBright: Color(0xfffdf7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f1fe),
      surfaceContainer: Color(0xfff2ebf8),
      surfaceContainerHigh: Color(0xffece6f2),
      surfaceContainerHighest: Color(0xffe6e0ed),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff491ab7),
      surfaceTint: Color(0xff6541d4),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff7c5aeb),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff463a74),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff796caa),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff7f006b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffbe42a3),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf7ff),
      onSurface: Color(0xff1c1a23),
      onSurfaceVariant: Color(0xff444150),
      outline: Color(0xff615d6d),
      outlineVariant: Color(0xff7d7889),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f38),
      inversePrimary: Color(0xffccbdff),
      primaryFixed: Color(0xff7c5aeb),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff633ed1),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff796caa),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff605390),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffbe42a3),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xffa02688),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffded8e4),
      surfaceBright: Color(0xfffdf7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f1fe),
      surfaceContainer: Color(0xfff2ebf8),
      surfaceContainerHigh: Color(0xffece6f2),
      surfaceContainerHighest: Color(0xffe6e0ed),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff260071),
      surfaceTint: Color(0xff6541d4),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff491ab7),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff251751),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff463a74),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff46003a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff7f006b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf7ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff252230),
      outline: Color(0xff444150),
      outlineVariant: Color(0xff444150),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f38),
      inversePrimary: Color(0xfff0e9ff),
      primaryFixed: Color(0xff491ab7),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff31008d),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff463a74),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff30235d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff7f006b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff58004a),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffded8e4),
      surfaceBright: Color(0xfffdf7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f1fe),
      surfaceContainer: Color(0xfff2ebf8),
      surfaceContainerHigh: Color(0xffece6f2),
      surfaceContainerHighest: Color(0xffe6e0ed),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffccbdff),
      surfaceTint: Color(0xffccbdff),
      onPrimary: Color(0xff350097),
      primaryContainer: Color(0xff7c5aeb),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffccbdff),
      onSecondary: Color(0xff342661),
      secondaryContainer: Color(0xff433771),
      onSecondaryContainer: Color(0xffdacfff),
      tertiary: Color(0xffffade4),
      onTertiary: Color(0xff5f0050),
      tertiaryContainer: Color(0xffbe42a3),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff14121b),
      onSurface: Color(0xffe6e0ed),
      onSurfaceVariant: Color(0xffcac3d7),
      outline: Color(0xff938ea0),
      outlineVariant: Color(0xff484554),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e0ed),
      inversePrimary: Color(0xff6541d4),
      primaryFixed: Color(0xffe7deff),
      onPrimaryFixed: Color(0xff1f0060),
      primaryFixedDim: Color(0xffccbdff),
      onPrimaryFixedVariant: Color(0xff4d21bb),
      secondaryFixed: Color(0xffe7deff),
      onSecondaryFixed: Color(0xff1e0f4b),
      secondaryFixedDim: Color(0xffccbdff),
      onSecondaryFixedVariant: Color(0xff4a3e79),
      tertiaryFixed: Color(0xffffd7ee),
      onTertiaryFixed: Color(0xff3a0030),
      tertiaryFixedDim: Color(0xffffade4),
      onTertiaryFixedVariant: Color(0xff850371),
      surfaceDim: Color(0xff14121b),
      surfaceBright: Color(0xff3a3841),
      surfaceContainerLowest: Color(0xff0f0d15),
      surfaceContainerLow: Color(0xff1c1a23),
      surfaceContainer: Color(0xff211e27),
      surfaceContainerHigh: Color(0xff2b2932),
      surfaceContainerHighest: Color(0xff36333d),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd0c2ff),
      surfaceTint: Color(0xffccbdff),
      onPrimary: Color(0xff190052),
      primaryContainer: Color(0xff987bff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd0c2ff),
      onSecondary: Color(0xff190845),
      secondaryContainer: Color(0xff9688c8),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffb4e5),
      onTertiary: Color(0xff310028),
      tertiaryContainer: Color(0xffe160c1),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff14121b),
      onSurface: Color(0xfffef9ff),
      onSurfaceVariant: Color(0xffcec8db),
      outline: Color(0xffa6a0b2),
      outlineVariant: Color(0xff868092),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e0ed),
      inversePrimary: Color(0xff4e23bc),
      primaryFixed: Color(0xffe7deff),
      onPrimaryFixed: Color(0xff140044),
      primaryFixedDim: Color(0xffccbdff),
      onPrimaryFixedVariant: Color(0xff3b00a6),
      secondaryFixed: Color(0xffe7deff),
      onSecondaryFixed: Color(0xff130241),
      secondaryFixedDim: Color(0xffccbdff),
      onSecondaryFixedVariant: Color(0xff392d67),
      tertiaryFixed: Color(0xffffd7ee),
      onTertiaryFixed: Color(0xff280021),
      tertiaryFixedDim: Color(0xffffade4),
      onTertiaryFixedVariant: Color(0xff690058),
      surfaceDim: Color(0xff14121b),
      surfaceBright: Color(0xff3a3841),
      surfaceContainerLowest: Color(0xff0f0d15),
      surfaceContainerLow: Color(0xff1c1a23),
      surfaceContainer: Color(0xff211e27),
      surfaceContainerHigh: Color(0xff2b2932),
      surfaceContainerHighest: Color(0xff36333d),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffef9ff),
      surfaceTint: Color(0xffccbdff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffd0c2ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffef9ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd0c2ff),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9f9),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffb4e5),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff14121b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffef9ff),
      outline: Color(0xffcec8db),
      outlineVariant: Color(0xffcec8db),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e0ed),
      inversePrimary: Color(0xff2e0086),
      primaryFixed: Color(0xffebe3ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffd0c2ff),
      onPrimaryFixedVariant: Color(0xff190052),
      secondaryFixed: Color(0xffebe3ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffd0c2ff),
      onSecondaryFixedVariant: Color(0xff190845),
      tertiaryFixed: Color(0xffffdef0),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffb4e5),
      onTertiaryFixedVariant: Color(0xff310028),
      surfaceDim: Color(0xff14121b),
      surfaceBright: Color(0xff3a3841),
      surfaceContainerLowest: Color(0xff0f0d15),
      surfaceContainerLow: Color(0xff1c1a23),
      surfaceContainer: Color(0xff211e27),
      surfaceContainerHigh: Color(0xff2b2932),
      surfaceContainerHighest: Color(0xff36333d),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
