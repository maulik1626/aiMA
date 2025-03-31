import 'dart:io';
// import 'package:device_info_plus/device_info_plus.dart';
//
// class GetDeviceDetails {
//   static Future<String> getDeviceId() async {
//     final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//     if (Platform.isAndroid) {
//       final result = await deviceInfoPlugin.androidInfo;
//       return result.id.toString();
//     }
//     if (Platform.isIOS) {
//       final result = await deviceInfoPlugin.iosInfo;
//       return result.identifierForVendor.toString();
//     }
//     return 'Unidentified Device';
//   }
//
//   static Future<String> getDeviceName() async {
//     final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//
//     if (Platform.isIOS) {
//       final result = await deviceInfoPlugin.iosInfo;
//       return result.name.toString();
//     }
//     if (Platform.isAndroid) {
//       final result = await deviceInfoPlugin.androidInfo;
//       return '${result.brand} ${result.product} ${result.model}';
//     }
//     return 'Unidentified Device';
//   }
//
//   static Future<String> getOSVersion() async {
//     final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//
//     if (Platform.isIOS) {
//       final result = await deviceInfoPlugin.iosInfo;
//       return result.systemVersion.toString();
//     }
//     if (Platform.isAndroid) {
//       final result = await deviceInfoPlugin.androidInfo;
//       return result.version.release.toString();
//     }
//     return 'Unidentified Device';
//   }
// }
