import 'package:aima/app/common/theme/palette.dart';
import 'package:flutter/material.dart';

class ColorGradients {
  static LinearGradient get welcomeScreenGradient => const LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        stops: [0, 100],
        colors: [
          Color(0xff885FD2),
          Color(0xff493BB8),
        ],
      );

  static LinearGradient get welcomeScreenGradientReversed => const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0, 100],
    colors: [
      Color(0xff885FD2),
      Color(0xff493BB8),
    ],
  );

  static LinearGradient get landingScreenGradientTwo => LinearGradient(
        colors: [
          Palette.kPrimary.shade200.withOpacity(0),
          Palette.kPrimary.shade400.withOpacity(0),
          Palette.kPrimary,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
}
