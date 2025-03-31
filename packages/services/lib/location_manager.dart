import 'dart:async';
import 'dart:developer';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;

/// Manages location-related functionality including getting current position and accessing location settings.
class LocationManager {
  static final LocationManager _instance = LocationManager._internal();
  Position? currentPosition;
  LocationPermission _permission = LocationPermission.denied;
  LocationAccuracyStatus _accuracyStatus = LocationAccuracyStatus.reduced;
  final StreamController<LocationPermission> _permissionController =
      StreamController<LocationPermission>.broadcast();
  final StreamController<LocationAccuracyStatus> _accuracyController =
      StreamController<LocationAccuracyStatus>.broadcast();
  StreamSubscription<Position>? _positionStreamSubscription;

  factory LocationManager() {
    return _instance;
  }

  LocationManager._internal();

  void initialize() async {
    _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.denied) {
      _permission = await Geolocator.requestPermission();
    }

    if (_permission == LocationPermission.deniedForever) {
      _permission = await Geolocator.requestPermission();
    }

    if (_permission == LocationPermission.whileInUse ||
        _permission == LocationPermission.always) {
      _accuracyStatus = await Geolocator.getLocationAccuracy();
      _positionStreamSubscription = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 100,
        ),
      ).listen((Position position) async {
        currentPosition = position;
        _accuracyStatus = await Geolocator.getLocationAccuracy();
        _accuracyController
            .add(_accuracyStatus); // Add accuracy change event to stream
      });
    }

    _permissionController
        .add(_permission); // Add initial permission status to stream
  }

  void dispose() {
    _positionStreamSubscription?.cancel();
    _permissionController.close();
    _accuracyController.close();
  }

  Stream<LocationPermission> get permissionStream =>
      _permissionController.stream;

  Stream<LocationAccuracyStatus> get accuracyStream =>
      _accuracyController.stream;

  /// Gets the current position of the device.
  ///
  /// If location services are disabled, prompts the user to enable them.
  /// If permissions are denied, requests permission from the user.
  /// Returns [LocationServiceStatus] indicating the status of location services.
  ///
  /// Example:
  /// ```dart
  /// void main() async {
  ///   LocationManager locationManager = LocationManager();
  ///
  ///   // Get current position
  ///   LocationServiceStatus status = await locationManager.getCurrentPosition();
  ///
  ///   // Check the status and handle accordingly
  ///   if (status == LocationServiceStatus.ENABLED) {
  ///     // Location services enabled, currentPosition will be available
  ///     print('Current position: ${locationManager.currentPosition}');
  ///   } else {
  ///     // Location services disabled or permissions denied
  ///     print('Failed to get current position. Location services might be disabled or permissions denied.');
  ///   }
  /// }
  /// ```
  Stream<LocationServiceStatus> getCurrentPositionSTREAM({
    LocationAccuracy accuracy = LocationAccuracy.high,
    Duration timeLimit = const Duration(seconds: 10),
  }) async* {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Request the user to enable location services
      await Geolocator.openLocationSettings();
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        yield LocationServiceStatus.DISABLED;
        return;
      }
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        yield LocationServiceStatus.DISABLED;
        return;
      }
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: accuracy,
        timeLimit: timeLimit,
      );
      log("Location Captured: $position"); // Logging the captured position

      LocationAccuracyStatus locationAccuracyStatus =
          await _getLocationAccuracy();
      if (locationAccuracyStatus == LocationAccuracyStatus.precise) {
        log("Precise location accuracy");
        // currentPosition = position;
        yield LocationServiceStatus.ENABLED;
      } else {
        log("Location accuracy not precise");
        // currentPosition = position;
        yield LocationServiceStatus.NOT_PRECISE;
      }
    } on TimeoutException catch (e) {
      log("Location request timed out: $e"); // Logging timeout exception
      yield LocationServiceStatus.DISABLED;
    } catch (e) {
      log("Error getting current location: $e"); // Logging other exceptions
      yield LocationServiceStatus.DISABLED;
    }
  }

  Future<LocationServiceStatus> getCurrentPositionA({
    LocationAccuracy accuracy = LocationAccuracy.high,
  }) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Request the user to enable location services
      await Geolocator.openLocationSettings();
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return LocationServiceStatus.DISABLED;
      }
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return LocationServiceStatus.DISABLED;
      }
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: accuracy,
      ).timeout(
        const Duration(minutes: 1),
      );
      log("Location Captured: $position"); // Logging the captured position

      LocationAccuracyStatus locationAccuracyStatus =
          await _getLocationAccuracy();
      if (locationAccuracyStatus == LocationAccuracyStatus.precise) {
        log("Precise location accuracy");
        currentPosition = position;
        return LocationServiceStatus.ENABLED;
      } else {
        log("Location accuracy not precise");
        // currentPosition = position;
        return LocationServiceStatus.NOT_PRECISE;
      }
    } on TimeoutException catch (e) {
      log("Location request timed out: $e"); // Logging timeout exception
      return LocationServiceStatus.DISABLED;
    } catch (e) {
      log("Error getting current location: $e"); // Logging other exceptions
      return LocationServiceStatus.DISABLED;
    }
  }

  /// Opens the app settings to allow the user to enable permissions.
  static openSettingsForApp() async {
    await permission_handler.openAppSettings();
  }

  /// Opens the location settings to allow the user to enable permissions.
  static openSettingsForLocation() async {
    await Geolocator.openLocationSettings();
  }

  /// Check location accuracy
  Future<LocationAccuracyStatus> _getLocationAccuracy() async {
    // Checking Location Accuracy
    LocationAccuracyStatus checkAccuracy =
        await Geolocator.getLocationAccuracy();
    return checkAccuracy;
  }
}

/// Enum representing the status of location services.
enum LocationServiceStatus { ENABLED, DISABLED, NOT_PRECISE }
