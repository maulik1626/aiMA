import 'dart:developer';
import 'package:flutter/material.dart';
import 'location_access_functionality.dart';

// class LocationPermissionsProvider extends ChangeNotifier {
//   bool hasLocationServiceEnabled = false;
//   LocationPermissionAndAccuracyStatus permissionAndAccuracyStatus = LocationPermissionAndAccuracyStatus.deniedForever;
//   bool isDeviceLocationShared = false;
//   bool shareLocationWithCaptains = true;
//   bool shareLocationInEmergency = true;
//
//   Future<void> checkLocationPermissions() async {
//     hasLocationServiceEnabled = await LocationAccessFunctionality().checkLocationServiceAvailable();
//     permissionAndAccuracyStatus = await LocationAccessFunctionality().checkLocationPermission();
//
//     if (hasLocationServiceEnabled && permissionAndAccuracyStatus == LocationPermissionAndAccuracyStatus.preciseAndEnabled) {
//       isDeviceLocationShared = true;
//     } else {
//       isDeviceLocationShared = false;
//     }
//
//     log("hasLocationServiceEnabled: $hasLocationServiceEnabled");
//     log("permissionAndAccuracyStatus: $permissionAndAccuracyStatus");
//     log("isDeviceLocationShared : $isDeviceLocationShared");
//
//     notifyListeners();
//   }
// }

// class LocationPermissionsProviderNew extends ChangeNotifier with WidgetsBindingObserver {
//   bool hasLocationServiceEnabled = false;
//   LocationPermissionAndAccuracyStatus permissionAndAccuracyStatus = LocationPermissionAndAccuracyStatus.deniedForever;
//   bool isDeviceLocationShared = false;
//   bool shareLocationWithCaptains = true;
//   bool shareLocationInEmergency = true;
//
//   LocationPermissionsProviderNew() {
//     // Register the observer to listen to app lifecycle events
//     WidgetsBinding.instance.addObserver(this);
//     checkLocationPermissions(); // Initial check when provider is created
//   }
//
//   @override
//   void dispose() {
//     // Remove observer to prevent memory leaks
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     switch (state) {
//       case AppLifecycleState.inactive:
//         // App is inactive, often triggered when navigating away from the app.
//           log("AppLifecycleState: inactive");
//         break;
//       case AppLifecycleState.paused:
//         // App is in background but not closed
//           log("AppLifecycleState: paused");
//         break;
//       case AppLifecycleState.resumed:
//         // App has come back to the foreground
//           log("AppLifecycleState: resumed");
//         checkLocationPermissions(); // Check permissions when app resumes
//         break;
//       case AppLifecycleState.detached:
//         // App is being terminated
//           log("AppLifecycleState: detached");
//         break;
//       case AppLifecycleState.hidden:
//         // App is hidden, meaning it is not visible to the user
//           log("AppLifecycleState: hidden");
//         // checkLocationPermissions();
//         break;
//     }
//   }
//
//   Future<void> checkLocationPermissions() async {
//     hasLocationServiceEnabled = await LocationAccessFunctionality().checkLocationServiceAvailable();
//     permissionAndAccuracyStatus = await LocationAccessFunctionality().checkLocationPermission();
//     isDeviceLocationShared = hasLocationServiceEnabled && permissionAndAccuracyStatus == LocationPermissionAndAccuracyStatus.preciseAndEnabled;
//
//     log("hasLocationServiceEnabled: $hasLocationServiceEnabled");
//     log("permissionAndAccuracyStatus: $permissionAndAccuracyStatus");
//     log("isDeviceLocationShared: $isDeviceLocationShared");
//
//     notifyListeners();
//   }
// }