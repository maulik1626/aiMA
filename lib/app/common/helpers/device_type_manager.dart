// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';

/// Enum representing the device type.
enum MyDeviceType {
  MOBILE,
  TABLET,
}

/// A singleton class for managing device types.
class DeviceTypeManager {
  static DeviceTypeManager? _instance; // Nullable instance

  DeviceTypeManager._(); // Private constructor

  /// Gets the singleton instance of [DeviceTypeManager].
  ///
  /// Example:
  /// ```dart
  /// DeviceTypeManager deviceTypeManager = DeviceTypeManager.instance;
  /// ```
  static DeviceTypeManager get instance {
    _instance ??= DeviceTypeManager._(); // Create instance if null
    return _instance!;
  }

  /// Determines if the device is a mobile device based on the screen size.
  ///
  /// Returns `true` for mobile and `false` for tablet.
  ///
  /// Example:
  /// ```dart
  /// bool isMobile = DeviceTypeManager.instance.isMobileDevice(context);
  /// ```
  bool isMobileDevice(BuildContext context) {
    final data = MediaQuery.of(context);
    return data.size.shortestSide < 600;
  }

  /// Determines the device type based on the screen size.
  ///
  /// Returns [MyDeviceType.MOBILE] for mobile and [MyDeviceType.TABLET] for tablet.
  ///
  /// Example:
  /// ```dart
  /// DeviceType deviceType = DeviceTypeManager.instance.getDeviceType(context);
  /// ```
  MyDeviceType getDeviceType(BuildContext context) {
    final data = MediaQuery.of(context);
    return data.size.shortestSide < 600 ? MyDeviceType.MOBILE : MyDeviceType.TABLET;
  }

  /// Checks if the device type is a tablet.
  ///
  /// Returns `true` for tablet and `false` for mobile.
  ///
  /// Example:
  /// ```dart
  /// bool isTablet = DeviceTypeManager.instance.isTablet(context);
  /// ```
  bool isTablet(BuildContext context) => MediaQuery.of(context).size.shortestSide >= 600;
}
