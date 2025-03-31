// import 'package:aima/app/common/constants/assets_path.dart';
// import 'package:aima/app/common/constants/border_radius.dart';
// import 'package:aima/app/common/theme/palette.dart';
// import 'package:aima/app/common/utils/common_base.dart';
// import 'package:aima/app/common/widgets/app_bottom_sheet.dart';
// import 'package:aima/app/common/widgets/custom_app_buttons.dart';
// import 'package:aima/main.dart';
// import 'package:contacts_service/contacts_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:services/location_manager.dart';
//
// class ContactsAccessFunctionality {
//   /// Check if permission is granted to access contacts
//   Future<bool> _isPermissionGranted() async {
//     final PermissionStatus status = await Permission.contacts.status;
//     return status.isGranted;
//   }
//
//   /// Request permission to access contacts
//   Future<bool> _requestPermission() async {
//     final PermissionStatus status = await Permission.contacts.request();
//     return status.isGranted;
//   }
//
//   /// Get contacts
//   Future<List<Contact>?> getContacts() async {
//     if (await _isPermissionGranted()) {
//       try {
//         return await ContactsService.getContacts(withThumbnails: true);
//       } catch (e) {
//         log('Error retrieving contacts: $e');
//         return null;
//       }
//     } else {
//       final permissionGranted = await _requestPermission();
//       if (permissionGranted) {
//         return await ContactsService.getContacts();
//       } else {
//         _buildContactsAccessDeniedBottomSheet();
//         return null;
//       }
//     }
//   }
//
//   void _buildContactsAccessDeniedBottomSheet() {
//     showModalBottomSheet(
//       context: AppNavigatorContext.context!,
//       isScrollControlled: true,
//       builder: (context) {
//         return AppBottomSheet(
//           height: 450,
//           title: 'Contacts Access Denied',
//           hasBottomButton: true,
//           bottomButton: CustomAppButton(
//             onTap: () {
//               HapticFeedback.lightImpact();
//               LocationManager.openSettingsForApp();
//               Navigator.pop(context);
//             },
//             isNonTraditionalButton: true,
//             nonTraditionalButtonChild: Container(
//               height: 50,
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(AppBorderRadius.m),
//                 border: Border.all(
//                   color: Palette.kPrimary,
//                   width: 1.5,
//                 ),
//               ),
//               alignment: Alignment.center,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SVGAssetsPath.icSettings.iconImage(
//                     color: Palette.kPrimary,
//                     size: 20,
//                   ),
//                   10.width,
//                   Text(
//                     'Grant Permission in Settings',
//                     style: primaryTextStyle(
//                       weight: FontWeight.w500,
//                       color: Palette.kPrimary,
//                       size: 14,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           children: [
//             Container(
//               height: 250,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(PNGAssetsPath.contactsAccessDenied),
//                   fit: BoxFit.fitHeight,
//                 ),
//               ),
//             ),
//             const Text("We don't have permission to access your contacts. Please enable the permission in the settings."),
//           ],
//         );
//       },
//     );
//   }
// }