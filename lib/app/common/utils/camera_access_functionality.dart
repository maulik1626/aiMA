// import 'dart:io';
// import 'package:aima/app/common/constants/assets_path.dart';
// import 'package:aima/app/common/constants/border_radius.dart';
// import 'package:aima/app/common/theme/palette.dart';
// import 'package:aima/app/common/utils/common_base.dart';
// import 'package:aima/app/common/widgets/app_bottom_sheet.dart';
// import 'package:aima/app/common/widgets/custom_app_buttons.dart';
// import 'package:aima/main.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'dart:math' as math;
// import 'package:permission_handler/permission_handler.dart';
// import 'package:services/location_manager.dart';
//
// class CameraAccessFunctionality {
//   XFile? pickedImageFile;
//   String? imageFileName;
//   String? imageFileSize;
//   File? imageFile;
//
//   Future<void> getImageFromUser(
//     BuildContext context, {
//     required ImageSource imageSource,
//   }) async {
//     try {
//       pickedImageFile =
//           await ImagePicker().pickImage(source: imageSource, imageQuality: 50);
//       imageFile = getFile(pickedImageFile);
//       if (pickedImageFile == null) {
//         log("Failed to pick image. Please try again.");
//         Navigator.pop(AppNavigatorContext.context!);
//         return;
//       }
//       if (imageFile == null) {
//         log("Failed to pick image. Please try again.");
//         Navigator.pop(AppNavigatorContext.context!);
//         return;
//       }
//       imageFileSize = getFileSizeString(bytes: imageFile!.lengthSync());
//       imageFileName = getFileName(pickedImageFile!.path);
//       log("imageFileName: $imageFileName");
//       Navigator.pop(AppNavigatorContext.context!);
//     } catch (error) {
//       await _handleImagePickingError(
//           AppNavigatorContext.context!, error, imageSource);
//     }
//   }
//
//   void removeImage() {
//     pickedImageFile = null;
//     imageFileName = null;
//     imageFileSize = null;
//     imageFile = null;
//   }
//
//   Future<void> _handleImagePickingError(
//     BuildContext context,
//     dynamic error,
//     ImageSource imageSource,
//   ) async {
//     // Handle errors related to image picking
//     PermissionStatus cameraStatus = await Permission.camera.status;
//     PermissionStatus galleryStatus = await Permission.photos.status;
//
//     if (imageSource == ImageSource.gallery) {
//       log("galleryStatus: $galleryStatus");
//       if (Navigator.of(AppNavigatorContext.context!).canPop()) {
//         Navigator.pop(AppNavigatorContext.context!);
//         _buildGalleryPermissionDeniedBottomSheet();
//         log("Please grant gallery permission to proceed.");
//       } else {
//         log("Cannot show Gallery dialog due to navigation stack state.");
//       }
//       return;
//     }
//
//     if (imageSource == ImageSource.camera) {
//       log("cameraStatus: $cameraStatus");
//       if (Navigator.of(AppNavigatorContext.context!).canPop()) {
//         Navigator.pop(AppNavigatorContext.context!);
//         _buildCameraPermissionDeniedBottomSheet();
//         log("Please grant camera permission to proceed.");
//       } else {
//         log("Cannot show Camera dialog due to navigation stack state.");
//       }
//       return;
//     }
//   }
//
//   // make a method that checks if the uploaded XFile is not null
//   // if it is not null, return the path of the file
//   // if it is null, return null
//   String? getFilePath(XFile? file) {
//     if (file != null) {
//       return file.path;
//     }
//     return null;
//   }
//
//   // method that checks if the pickedFile is not null and returns the file
//   // if it is null, return null
//   File? getFile(XFile? pickedFile) {
//     if (pickedFile != null) {
//       return File(pickedFile.path);
//     }
//     return null;
//   }
//
//   static String getFileName(String path) {
//     String fileName = path.split('/').last;
//     if (fileName.contains("image_picker")) {
//       String fileNameExtension = fileName.split('.').last;
//       fileName = "product.$fileNameExtension";
//     }
//     return fileName;
//   }
//
//   // Format File Size
//   static String getFileSizeString({required int bytes, int decimals = 0}) {
//     if (bytes <= 0) return "0 Bytes";
//     const suffixes = [" Bytes", "KB", "MB", "GB", "TB"];
//     var i = (math.log(bytes) / math.log(1024)).floor();
//     return ((bytes / math.pow(1024, i)).toStringAsFixed(decimals)) +
//         suffixes[i];
//   }
//
//   _buildGalleryPermissionDeniedBottomSheet() {
//     showModalBottomSheet(
//       context: AppNavigatorContext.context!,
//       isScrollControlled: true,
//       builder: (context) {
//         return AppBottomSheet(
//           height: 310,
//           title: 'Gallery Permission Denied',
//           hasBottomButton: true,
//           autoBottomButtonPadding: false,
//           bottomButton: AppBottomNavBar(child: CustomAppButton(
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
//           ),),
//           children: [
//             Container(
//               height: 250,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(PNGAssetsPath.galleryAccessDenied),
//                   fit: BoxFit.fitHeight,
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   _buildCameraPermissionDeniedBottomSheet() {
//     showModalBottomSheet(
//       context: AppNavigatorContext.context!,
//       isScrollControlled: true,
//       builder: (context) {
//         return AppBottomSheet(
//           height: 310,
//           title: 'Camera Permission Denied',
//           hasBottomButton: true,
//           autoBottomButtonPadding: false,
//           bottomButton: AppBottomNavBar(child: CustomAppButton(
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
//           ),),
//           children: [
//             Container(
//               height: 250,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(PNGAssetsPath.cameraAccessDenied),
//                   fit: BoxFit.fitHeight,
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// // _buildRemoveProfilePictureBottomSheet() {}
// }
