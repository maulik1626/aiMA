
import 'package:aima/app/common/theme/palette.dart';
import 'package:flutter/material.dart';

class ColorGradients {
  static LinearGradient get splashScreenGradient => LinearGradient(
        colors: [
          Palette.kPrimary,
          // Palette.kPrimary.shade50.withOpacity(0.5),
          Palette.kPrimary.shade50.withOpacity(0),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );

  static LinearGradient get landingScreenGradientOne => LinearGradient(
        colors: [
          Palette.kPrimary.shade100.withOpacity(0),
          Palette.kPrimary,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
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
