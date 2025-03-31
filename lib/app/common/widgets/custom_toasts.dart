// import 'dart:io';
// import 'dart:developer';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import '../helpers/get_device_details.dart';
// import '../theme/palette.dart';
//
// void showToast({required String msg, int iosMsgDurationInSec = 3}) async {
//   String osVersion = await GetDeviceDetails.getOSVersion();
//   int? androidOSVersion;
//   if (Platform.isIOS) {
//     log('iOS Version: $osVersion');
//   } else if (Platform.isAndroid) {
//     try {
//       androidOSVersion = int.parse(osVersion.split('.')[0]);
//       log('Android OS Version: $androidOSVersion');
//     } catch (e) {
//       log('Error parsing Android OS Version: $e');
//     }
//   } else {
//     log('Unknown OS Version');
//   }
//
//   Fluttertoast.showToast(
//     msg: (Platform.isAndroid)
//         ? (androidOSVersion != null)
//             ? (androidOSVersion >= 13)
//                 ? msg
//                 : msg
//             : msg
//         : msg,
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: (Platform.isIOS) ? ToastGravity.TOP : ToastGravity.BOTTOM,
//     timeInSecForIosWeb: iosMsgDurationInSec,
//     backgroundColor: (Platform.isIOS) ? Palette.kPrimary.shade700.withOpacity(0.75) : null,
//   );
// }
