//
//
// import 'package:nb_utils/nb_utils.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// Future<void> openSMSApp(String phoneNumber, String message) async {
//   final Uri smsUri = Uri(
//     scheme: 'sms',
//     path: phoneNumber,
//     queryParameters: <String, String>{
//       'body': message,
//     },
//   );
//
//   if (await canLaunchUrl(smsUri)) {
//     await launchUrl(smsUri);
//   } else {
//     throw 'Could not launch $smsUri';
//   }
// }