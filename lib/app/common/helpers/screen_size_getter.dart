/// ScreenSizeGetter.dart
///
/// A utility class to retrieve the dimensions of the screen.
/// This class provides a simple way to access the screen's width and height,
/// which can be useful for responsive design and layout adjustments.
///
/// @author Maulik Raja
/// @date 2024-03-01

import 'package:flutter/material.dart';

/// A utility class for retrieving screen size information.
class ScreenSizeGetter {
  /// Default constructor for the ScreenSizeGetter class.
  ScreenSizeGetter();

  /// Gets the screen width based on the provided [context].
  ///
  /// Returns the width of the screen.
  ///
  /// Example:
  /// ```dart
  /// double screenWidth = ScreenSizeGetter().getScreenWidth(context);
  /// ```
  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Gets the screen height based on the provided [context].
  ///
  /// Returns the height of the screen.
  ///
  /// Example:
  /// ```dart
  /// double screenHeight = ScreenSizeGetter().getScreenHeight(context);
  /// ```
  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
