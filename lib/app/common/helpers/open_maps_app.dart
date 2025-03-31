// import 'dart:io';
// import 'package:aima/app/common/constants/border_radius.dart';
// import 'package:aima/app/common/theme/palette.dart';
// import 'package:aima/app/common/widgets/app_bottom_sheet.dart';
// import 'package:aima/app/common/widgets/custom_app_buttons.dart';
// import 'package:aima/main.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// Future<void> openMapsApp(double latitude, double longitude) async {
//   if (Platform.isIOS) {
//     // Apple Maps URL scheme for iOS
//     _openChooseMapsBottomSheet(latitude, longitude);
//   }
//   if (Platform.isAndroid) {
//     // Google Maps URL scheme for Android
//     String mapUrl =
//         'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
//     Uri mapUri = Uri.parse(mapUrl);
//     if (await canLaunchUrl(mapUri)) {
//       await launchUrl(mapUri);
//     } else {
//       toast('Could not launch $mapUrl');
//     }
//   }
// }
//
// void _openChooseMapsBottomSheet(double latitude, double longitude) {
//   showModalBottomSheet(
//     context: AppNavigatorContext.context!,
//     isScrollControlled: true,
//     builder: (context) {
//       return AppBottomSheet(
//         height: 210,
//         title: 'Select Maps App',
//         titleColor: Palette.kBlack,
//         hasBottomButton: false,
//         children: [
//           Column(
//             children: [
//               CustomAppButton(
//                 onTap: () async {
//                   HapticFeedback.selectionClick();
//                   Navigator.pop(context);
//                   String mapUrl =
//                       'https://maps.apple.com/?ll=$latitude,$longitude';
//                   Uri mapUri = Uri.parse(mapUrl);
//                   if (await canLaunchUrl(mapUri)) {
//                     await launchUrl(mapUri);
//                   } else {
//                     toast('Could not launch $mapUrl');
//                   }
//                 },
//                 enableScaleAnimation: false,
//                 isNonTraditionalButton: true,
//                 nonTraditionalButtonChild: Container(
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Palette.kNeutral.shade100.withOpacity(0.5),
//                     borderRadius: radiusOnly(
//                       topLeft: AppBorderRadius.m,
//                       topRight: AppBorderRadius.m,
//                     ),
//                   ),
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Open in Maps",
//                       style: boldTextStyle(size: 14),
//                     ),
//                   ),
//                 ),
//               ),
//               1.height,
//               CustomAppButton(
//                 onTap: () async {
//                   HapticFeedback.selectionClick();
//                   Navigator.pop(context);
//                   String mapUrl =
//                       'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
//                   Uri mapUri = Uri.parse(mapUrl);
//                   if (await canLaunchUrl(mapUri)) {
//                     await launchUrl(mapUri);
//                   } else {
//                     toast('Could not launch $mapUrl');
//                   }
//                 },
//                 enableScaleAnimation: false,
//                 isNonTraditionalButton: true,
//                 nonTraditionalButtonChild: Container(
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Palette.kNeutral.shade100.withOpacity(0.5),
//                     borderRadius: radiusOnly(
//                       bottomLeft: AppBorderRadius.m,
//                       bottomRight: AppBorderRadius.m,
//                     ),
//                   ),
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Open in Google Maps",
//                       style: boldTextStyle(size: 14),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       );
//     },
//   );
// }
