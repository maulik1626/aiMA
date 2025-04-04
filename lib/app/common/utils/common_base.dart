// import 'dart:io';
// import 'dart:math';
// import 'package:aima/app/common/constants/assets_path.dart';
// import 'package:aima/app/common/constants/border_radius.dart';
// import 'package:aima/app/common/helpers/device_type_manager.dart';
// import 'package:aima/app/common/helpers/get_app_details.dart';
// import 'package:aima/app/common/helpers/get_device_details.dart';
// import 'package:aima/app/common/helpers/screen_size_getter.dart';
// import 'package:aima/app/common/theme/palette.dart';
// import 'package:aima/app/common/widgets/app_bottom_sheet.dart';
// import 'package:aima/app/common/widgets/custom_app_buttons.dart';
// import 'package:aima/main.dart';
// import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:services/location_manager.dart';
//
// Color getRandomShade50Color() {
//   // List of available colors in the Colors class
//   List<MaterialColor> colorPalette = [
//     Colors.red,
//     Colors.pink,
//     Colors.purple,
//     Colors.indigo,
//     Colors.blue,
//     Colors.cyan,
//     Colors.amber,
//   ];
//
//   // Generate a random index
//   final randomIndex = Random().nextInt(colorPalette.length);
//
//   // Return the color at the random index with shade 50
//   return colorPalette[randomIndex].shade50;
// }
//
// extension IntHeightEtx on int {
//   double dynamicHeight(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     return (this / 852) * screenHeight;
//   }
// }
//
// extension DoubleHeightEtx on double {
//   double dynamicHeight(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     return (this / 852) * screenHeight;
//   }
// }
//
// /// Extension for dynamic width
// /// width is calculate based on [393 width]
// extension IntWidthEtx on int {
//   double dynamicWidth(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return (this / 393) * screenWidth;
//   }
// }
//
// extension DoubleWidthEtx on double {
//   double dynamicWidth(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return (this / 393) * screenWidth;
//   }
// }
//

import 'package:aima/app/common/constants/assets_path.dart';
import 'package:flutter/material.dart';

extension StrEtx on String {
  Widget iconImage({
    double? size,
    Color? color,
    BoxFit? fit,
    double? height,
    double? width,
    AlignmentGeometry? alignment,
    bool isNetworkImage = false,
  }) {
    if (isNetworkImage) {
      return Image.network(
        this,
        height: height?.toDouble() ?? size ?? 14,
        width: width?.toDouble() ?? size ?? 14,
        fit: fit ?? BoxFit.cover,
        alignment: alignment ?? Alignment.center,
        color: color,
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return Image.asset(
            PNGAssetsPath.icNoPhoto,
            height: size ?? 14,
            width: size ?? 14,
            alignment: alignment ?? Alignment.center,
          );
        },
      );
    }
    if (endsWith('.svg')) {
      return const SizedBox.shrink();
    }
    // {
    //   return SvgPicture.asset(
    //     this,
    //     height: height?.toDouble() ?? size ?? 14,
    //     width: width?.toDouble() ?? size ?? 14,
    //     fit: fit ?? BoxFit.cover,
    //     color: color,
    //     alignment: alignment ?? Alignment.center,
    //     placeholderBuilder: (context) => Image.asset(
    //       PNGAssetsPath.icNoPhoto,
    //       height: size ?? 14,
    //       width: size ?? 14,
    //       alignment: alignment ?? Alignment.center,
    //     ),
    //   );
    // }
    else {
      return Image.asset(
        this,
        height: height?.toDouble() ?? size ?? 14,
        width: width?.toDouble() ?? size ?? 14,
        fit: fit ?? BoxFit.cover,
        color: color,
        alignment: alignment ?? Alignment.center,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            PNGAssetsPath.icNoPhoto,
            height: size ?? 14,
            width: size ?? 14,
            alignment: alignment ?? Alignment.center,
          );
        },
      );
    }
  }

  String get firstLetter => isNotEmpty ? this[0] : '';
}

Widget dragHandle() {
  return Container(
    height: 5,
    width: 57,
    decoration: BoxDecoration(
      color: const Color(0xff875FD2),
      borderRadius: BorderRadius.circular(100),
    ),
  );
}

// extension EnumToString on Enum {
//   String toShortString() {
//     return toString().split('.').last.replaceAll('_', ' ').toUpperCase();
//   }
// }
//
// // name validator
// String? nameValidator(String? value) {
//   if (value!.trim().isEmpty) {
//     return 'Name is required';
//   }
//   if (value.trim().length < 3) {
//     return 'Name must be at least 3 characters';
//   }
//   return null;
// }
//
// // Pet name validator
// String? petNameValidator(String? value) {
//   if (value!.trim().isEmpty) {
//     return 'Pet Name is required';
//   }
//   if (value.trim().length < 2) {
//     return 'Pet Name must be at least 2 characters';
//   }
//   return null;
// }
//
// // Pet name validator
// String? petBreedValidator(String? value) {
//   if (value!.trim().isEmpty) {
//     return 'Pet Breed is required';
//   }
//   return null;
// }
//
// // email validator
// String? emailValidator(String? value) {
//   if (value!.trim().isEmpty) {
//     return 'Email is required';
//   }
//   if (!isEmail(value.trim())) {
//     return 'Enter a valid email';
//   }
//   return null;
// }
//
// // isEmail regex
// bool isEmail(String value) =>
//     RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
//
// Widget buildIndicator(
//   BuildContext context,
//   int pageIndex,
//   int totalPages, {
//   Color? activeIndicatorColor,
//   Color? inactiveIndicatorColor,
//   Color? indicatorDecorationColor,
//   bool hasDecoration = false,
// }) {
//   return Align(
//     alignment: Alignment.center,
//     child: Container(
//       padding: hasDecoration ? const EdgeInsets.all(5) : null,
//       width: !hasDecoration ? 40 + (totalPages - 3) * 20 : null,
//       decoration: hasDecoration
//           ? BoxDecoration(
//               color: indicatorDecorationColor ?? Colors.white70,
//               borderRadius: BorderRadius.circular(20),
//             )
//           : null,
//       // Adjust width based on the number of indicators
//       height: 20,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: List.generate(
//           totalPages,
//           (index) {
//             return AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               width: pageIndex == index ? 20 : 5.56,
//               margin: hasDecoration
//                   ? const EdgeInsets.symmetric(horizontal: 2)
//                   : null,
//               height: 5.56,
//               decoration: BoxDecoration(
//                 // color: Palette.kPrimary.shade100,
//                 color: pageIndex == index
//                     ? activeIndicatorColor ?? Palette.kPrimary.shade100
//                     : inactiveIndicatorColor ?? Palette.kPrimary.shade100,
//                 borderRadius: BorderRadius.circular(AppBorderRadius.round),
//               ),
//             );
//           },
//         ),
//       ),
//     ),
//   ).paddingSymmetric(horizontal: 20);
// }
//
// // bottom sheet
// void showAppBottomSheet({
//   required Widget child,
//   required String title,
//   Color? titleColor,
//   Color? closeIconColor,
//   Widget? titleWidget,
//   Color? headerColor,
//   Color? backgroundColor,
//   double? sheetHeight,
//   Color? barrierColor,
//   Color? handleColor,
//   Widget? leadingWidget,
//   Widget? trailingWidget,
//   bool hasBottomButton = false,
//   bool isScrollControlled = true,
//   Widget? bottomButtonWidget,
//   String? bottomButtonText,
//   Color? bottomButtonColor,
//   bool? bottomButtonLoading,
//   Function? onBottomButtonTap,
//   Color? bottomButtonTextColor,
//   bool showCloseButton = true,
// }) {
//   showModalBottomSheet(
//     context: AppNavigatorContext.context!,
//     isScrollControlled: isScrollControlled,
//     barrierColor: barrierColor,
//     builder: (BuildContext context) {
//       return Container(
//         height:
//             sheetHeight ?? ScreenSizeGetter().getScreenHeight(context) * 0.85,
//         decoration: BoxDecoration(
//           color: backgroundColor ?? Palette.kWhite,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(AppBorderRadius.sm),
//             topRight: Radius.circular(AppBorderRadius.sm),
//           ),
//         ),
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: headerColor ?? backgroundColor ?? Palette.kWhite,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(AppBorderRadius.sm),
//                   topRight: Radius.circular(AppBorderRadius.sm),
//                 ),
//               ),
//               alignment: Alignment.center,
//               padding: const EdgeInsets.only(top: 10),
//               child: Container(
//                 height: 4,
//                 width: 60,
//                 decoration: BoxDecoration(
//                   color: handleColor ?? Palette.kGrey,
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               ),
//             ),
//             Container(
//               height: 65,
//               color: headerColor ?? backgroundColor ?? Palette.kWhite,
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),
//               alignment: Alignment.center,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   leadingWidget ??
//                       const SizedBox(
//                         height: 24,
//                         width: 24,
//                       ),
//                   const Spacer(),
//                   titleWidget ??
//                       Text(
//                         title,
//                         style: boldTextStyle(
//                           weight: FontWeight.w700,
//                           color: titleColor ?? Palette.kNeutral.shade900,
//                           size: 16,
//                         ),
//                       ),
//                   const Spacer(),
//                   showCloseButton
//                       ? trailingWidget ??
//                           SVGAssetsPath.icCloseSquareOutlined
//                               .iconImage(
//                                   size: 24,
//                                   color: closeIconColor ??
//                                       Palette.kNeutral.shade900)
//                               .onTap(() {
//                             Navigator.pop(context);
//                           })
//                       : const SizedBox(
//                           height: 24,
//                           width: 24,
//                         ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: SizedBox(
//                 width: double.infinity,
//                 child: child,
//               ),
//             ),
//             if (hasBottomButton) ...[
//               20.height,
//               bottomButtonWidget ??
//                   CustomAppButton(
//                     onTap: onBottomButtonTap,
//                     buttonType: ButtonType.PRIMARY,
//                     buttonSize: ButtonSize.PX56,
//                     width: double.infinity,
//                     enabled: true,
//                     isLoading: bottomButtonLoading ?? false,
//                     text: bottomButtonText ?? 'Continue',
//                     color: bottomButtonColor,
//                     textStyle: boldTextStyle(
//                       color: bottomButtonTextColor ?? Palette.kWhite,
//                       weight: FontWeight.w700,
//                       size: 16,
//                     ),
//                   ).paddingSymmetric(horizontal: 20),
//               Platform.isAndroid ? 20.height : 40.height,
//             ],
//           ],
//         ),
//       );
//     },
//   );
// }
//
// Future<String> getAppVersion() async => await GetAppDetails.getAppVersion();
//
// Future<Map<String, dynamic>> getDeviceInfo() async {
//   String deviceId = await GetDeviceDetails.getDeviceId();
//   String deviceName = await GetDeviceDetails.getDeviceName();
//   String osVersion = await GetDeviceDetails.getOSVersion();
//   MyDeviceType myDeviceType =
//       DeviceTypeManager.instance.getDeviceType(AppNavigatorContext.context!);
//   String platform = Platform.isAndroid ? "ANDROID" : "IOS";
//
//   return {
//     "device_id": deviceId,
//     "device_type": myDeviceType.name,
//     "device_name": deviceName,
//     "platform": platform,
//     "os_version": osVersion,
//   };
// }
//
// // void buildSelectLocationBottomSheet(
// //   BuildContext context, {
// //   bool isDismissible = true,
// //   bool enableDrag = true,
// //   String? searchControllerText,
// // }) {
// //   LocationAccessFunctionality userLocator = LocationAccessFunctionality();
// //
// //   userLocator.checkLocationPermission();
// //
// //   showModalBottomSheet(
// //     context: context,
// //     isDismissible: isDismissible,
// //     enableDrag: enableDrag,
// //     isScrollControlled: true,
// //     builder: (context) {
// //       bool isCurrentLocationLoading = false;
// //       return StatefulBuilder(
// //         builder: (BuildContext context, StateSetter setState) {
// //           return Consumer<LocationPermissionsProvider>(
// //             builder: (BuildContext context,
// //                 LocationPermissionsProvider locationPermissionProv,
// //                 Widget? _) {
// //               return Consumer<BaseProvider>(
// //                 builder:
// //                     (BuildContext context, BaseProvider baseProv, Widget? _) {
// //                   return AppBottomSheet(
// //                     height: context.height() * 0.9,
// //                     title: 'Select Location',
// //                     // hasSearchBar: true,
// //                     // searchBar: AppTextField(
// //                     //   controller: locationSearchController,
// //                     //   textFieldType: TextFieldType.NAME,
// //                     //   maxLines: 1,
// //                     //   maxLength: 50,
// //                     //   onChanged: (value) async {
// //                     //     predictions = await userLocator.placeAutocomplete(
// //                     //       context: context,
// //                     //       query: locationSearchController.text.trim(),
// //                     //     );
// //                     //     setState(() {});
// //                     //   },
// //                     //   onFieldSubmitted: (_) {
// //                     //     hideKeyboard(context);
// //                     //   },
// //                     //   validator: petNameValidator,
// //                     //   isValidationRequired: true,
// //                     //   keyboardAppearance: Brightness.dark,
// //                     //   cursorColor: Palette.kClinicPrimary1000,
// //                     //   textStyle: primaryTextStyle(
// //                     //     weight: FontWeight.w500,
// //                     //     color: Palette.kClinicPrimary1000,
// //                     //     size: 14,
// //                     //   ),
// //                     //   decoration: InputDecoration(
// //                     //     hintText: 'Search for area, city or locality',
// //                     //     hintStyle: primaryTextStyle(
// //                     //       weight: FontWeight.w500,
// //                     //       color: Palette.kClinicPrimary1000.withOpacity(0.5),
// //                     //       size: 14,
// //                     //     ),
// //                     //     floatingLabelStyle: primaryTextStyle(
// //                     //       weight: FontWeight.w500,
// //                     //       color: Palette.kClinicPrimary1000,
// //                     //       size: 14,
// //                     //     ),
// //                     //     counter: Visibility(
// //                     //       visible: false,
// //                     //       child: Text(
// //                     //         "Locate on map",
// //                     //         style: primaryTextStyle(
// //                     //           weight: FontWeight.w500,
// //                     //           color: Palette.kNeutral.shade700,
// //                     //           size: 14,
// //                     //         ),
// //                     //       ),
// //                     //     ),
// //                     //     labelStyle: primaryTextStyle(
// //                     //       weight: FontWeight.w500,
// //                     //       color: Palette.kClinicPrimary1000.withOpacity(0.5),
// //                     //       size: 14,
// //                     //     ),
// //                     //     prefixIconConstraints: const BoxConstraints(
// //                     //       minWidth: 40,
// //                     //       minHeight: 40,
// //                     //     ),
// //                     //     prefixIcon: SVGAssetsPath.icSearch
// //                     //         .iconImage(
// //                     //       color:
// //                     //       Palette.kClinicPrimary1000.withOpacity(0.5),
// //                     //     )
// //                     //         .paddingAll(10),
// //                     //     suffixIcon:
// //                     //     locationSearchController.text.trim().isNotEmpty
// //                     //         ? Padding(
// //                     //       padding: const EdgeInsetsDirectional.only(
// //                     //           end: 20.0,
// //                     //           top: 12,
// //                     //           bottom: 12,
// //                     //           start: 12),
// //                     //       child: SVGAssetsPath.icCloseSquareOutlined
// //                     //           .iconImage(
// //                     //         size: 24,
// //                     //         color: Palette.kClinicPrimary1000
// //                     //             .withOpacity(0.5),
// //                     //       )
// //                     //           .onTap(() {
// //                     //         HapticFeedback.lightImpact();
// //                     //         locationSearchController.clear();
// //                     //         predictions.clear();
// //                     //         setState(() {});
// //                     //       }),
// //                     //     )
// //                     //         : null,
// //                     //     errorStyle: primaryTextStyle(
// //                     //       weight: FontWeight.w500,
// //                     //       color: Palette.kError.shade100,
// //                     //       size: 12,
// //                     //     ),
// //                     //     errorBorder: OutlineInputBorder(
// //                     //       borderRadius:
// //                     //       BorderRadius.circular(AppBorderRadius.m),
// //                     //       borderSide: BorderSide(
// //                     //         color: Palette.kError.shade100,
// //                     //         width: 1.5,
// //                     //       ),
// //                     //     ),
// //                     //     focusedErrorBorder: OutlineInputBorder(
// //                     //       borderRadius:
// //                     //       BorderRadius.circular(AppBorderRadius.m),
// //                     //       borderSide: BorderSide(
// //                     //         color: Palette.kError.shade100,
// //                     //         width: 1.5,
// //                     //       ),
// //                     //     ),
// //                     //     border: OutlineInputBorder(
// //                     //       borderRadius:
// //                     //       BorderRadius.circular(AppBorderRadius.m),
// //                     //       borderSide: BorderSide(
// //                     //         color:
// //                     //         Palette.kClinicPrimary1000.withOpacity(0.5),
// //                     //         width: 1.5,
// //                     //       ),
// //                     //     ),
// //                     //     enabledBorder: OutlineInputBorder(
// //                     //       borderRadius:
// //                     //       BorderRadius.circular(AppBorderRadius.m),
// //                     //       borderSide: BorderSide(
// //                     //         color:
// //                     //         Palette.kClinicPrimary1000.withOpacity(0.5),
// //                     //         width: 1.5,
// //                     //       ),
// //                     //     ),
// //                     //     focusedBorder: OutlineInputBorder(
// //                     //       borderRadius:
// //                     //       BorderRadius.circular(AppBorderRadius.m),
// //                     //       borderSide: const BorderSide(
// //                     //         color: Palette.kClinicPrimary1000,
// //                     //         width: 1.5,
// //                     //       ),
// //                     //     ),
// //                     //   ),
// //                     // ),
// //                     children: [
// //                       AnimatedScrollView(
// //                         children: [
// //                           if (!locationPermissionProv.isDeviceLocationShared)
// //                             Column(
// //                               children: [
// //                                 CustomAppButton(
// //                                   onTap: () {
// //                                     LocationManager.openSettingsForApp();
// //                                   },
// //                                   isNonTraditionalButton: true,
// //                                   nonTraditionalButtonChild: Container(
// //                                     width: double.infinity,
// //                                     padding: const EdgeInsets.symmetric(
// //                                       horizontal: 16,
// //                                       vertical: 10,
// //                                     ),
// //                                     decoration: BoxDecoration(
// //                                       color: Palette.kError.shade100,
// //                                       borderRadius: radius(AppBorderRadius.m),
// //                                     ),
// //                                     alignment: Alignment.center,
// //                                     child: Row(
// //                                       crossAxisAlignment:
// //                                           CrossAxisAlignment.center,
// //                                       children: [
// //                                         SVGAssetsPath.icLocationDisabled
// //                                             .iconImage(
// //                                           size: 20,
// //                                           color: Palette.kPrimary,
// //                                         ),
// //                                         10.width,
// //                                         SizedBox(
// //                                           width: context.width() * 0.6,
// //                                           child: Column(
// //                                             mainAxisSize: MainAxisSize.min,
// //                                             crossAxisAlignment:
// //                                                 CrossAxisAlignment.start,
// //                                             children: [
// //                                               Text(
// //                                                 "Device location not enabled",
// //                                                 style: primaryTextStyle(
// //                                                   size: 14,
// //                                                   color: Palette.kPrimary,
// //                                                 ),
// //                                               ),
// //                                               Text(
// //                                                 "For better app experience, please go to settings and enable location permission or select a location manually.",
// //                                                 maxLines: 5,
// //                                                 overflow:
// //                                                     TextOverflow.ellipsis,
// //                                                 style: secondaryTextStyle(
// //                                                   color: Palette.kBlack,
// //                                                   size: 12,
// //                                                 ),
// //                                               ),
// //                                             ],
// //                                           ),
// //                                         ),
// //                                         const Spacer(),
// //                                         SVGAssetsPath.icArrowRight2.iconImage(
// //                                           color: Palette.kPrimary,
// //                                           size: 16,
// //                                         ),
// //                                       ],
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 10.height,
// //                               ],
// //                             ),
// //                           Container(
// //                             height: 100.5,
// //                             color: Colors.transparent,
// //                             child: Column(
// //                               children: [
// //                                 CustomAppButton(
// //                                   onTap: () {
// //                                     locationPermissionProv.checkLocationPermissions();
// //                                     setState(() {isCurrentLocationLoading = true;});
// //                                     baseProv.getCurrentLocation().then((value) {setState(() {isCurrentLocationLoading = false;});},);
// //                                     if (locationPermissionProv.isDeviceLocationShared && baseProv.locationFetched) {
// //                                       Navigator.pushNamed(context, Routes.SELECT_LOCATION_ON_MAP, arguments: baseProv.selectLocationOnMapScreenArguments);
// //                                     }
// //                                   },
// //                                   isNonTraditionalButton: true,
// //                                   enableScaleAnimation: false,
// //                                   nonTraditionalButtonChild: Container(
// //                                     height: 50,
// //                                     width: double.infinity,
// //                                     padding: const EdgeInsets.symmetric(
// //                                         horizontal: 16),
// //                                     decoration: BoxDecoration(
// //                                       color:
// //                                           Palette.kPrimary.withOpacity(0.1),
// //                                       borderRadius: BorderRadius.only(
// //                                         topLeft: Radius.circular(
// //                                             AppBorderRadius.ml),
// //                                         topRight: Radius.circular(
// //                                             AppBorderRadius.ml),
// //                                       ),
// //                                     ),
// //                                     alignment: Alignment.center,
// //                                     child: Row(
// //                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                                       children: [
// //                                         Row(
// //                                           children: [
// //                                             SVGAssetsPath.icCurrentLocation
// //                                                 .iconImage(
// //                                                     size: 20,
// //                                                     color: Palette.kPrimary),
// //                                             10.width,
// //                                             Text(
// //                                               "Use Current Location",
// //                                               style: primaryTextStyle(
// //                                                 size: 14,
// //                                                 color: Palette.kPrimary,
// //                                               ),
// //                                             ),
// //                                           ],
// //                                         ),
// //                                         if (isCurrentLocationLoading)
// //                                           const SizedBox(
// //                                             height: 20,
// //                                             width: 20,
// //                                             child: CircularProgressIndicator(
// //                                               valueColor:
// //                                                   AlwaysStoppedAnimation<Color>(
// //                                                       Palette.kPrimary),
// //                                               strokeWidth: 2,
// //                                             ),
// //                                           ),
// //                                       ],
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 Container(
// //                                   height: 0.5,
// //                                   width: double.infinity,
// //                                   color: Palette.kPrimary.withOpacity(0.2),
// //                                 ),
// //                                 CustomAppButton(
// //                                   onTap: () {
// //                                     Navigator.pushNamed(
// //                                       context,
// //                                       Routes.ADDRESS_SELECTION,
// //                                     );
// //                                   },
// //                                   enableScaleAnimation: false,
// //                                   isNonTraditionalButton: true,
// //                                   nonTraditionalButtonChild: Container(
// //                                     height: 50,
// //                                     width: double.infinity,
// //                                     padding: const EdgeInsets.symmetric(
// //                                         horizontal: 16),
// //                                     decoration: BoxDecoration(
// //                                       color:
// //                                           Palette.kPrimary.withOpacity(0.1),
// //                                       borderRadius: BorderRadius.only(
// //                                         bottomLeft: Radius.circular(
// //                                             AppBorderRadius.ml),
// //                                         bottomRight: Radius.circular(
// //                                             AppBorderRadius.ml),
// //                                       ),
// //                                     ),
// //                                     child: Row(
// //                                       children: [
// //                                         SVGAssetsPath.icAddLocation.iconImage(
// //                                             size: 18,
// //                                             color: Palette.kPrimary),
// //                                         12.width,
// //                                         Text(
// //                                           "Add New Location",
// //                                           style: primaryTextStyle(
// //                                             size: 14,
// //                                             color: Palette.kPrimary,
// //                                           ),
// //                                         ),
// //                                       ],
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                           10.height,
// //                           Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Text(
// //                                 "Your Saved Locations",
// //                                 style: boldTextStyle(
// //                                   size: 16,
// //                                   color: Palette.kPrimary,
// //                                   weight: FontWeight.w600,
// //                                 ),
// //                               ).withTooltip(
// //                                   msg:
// //                                       "Your Saved Locations / Popular Locations"),
// //                               AnimatedScrollView(
// //                                 children: List.generate(
// //                                   5,
// //                                   (index) {
// //                                     return CustomAppButton(
// //                                       onTap: () {
// //                                         HapticFeedback.selectionClick();
// //                                       },
// //                                       isNonTraditionalButton: true,
// //                                       nonTraditionalButtonChild: Container(
// //                                         height: 50,
// //                                         width: double.infinity,
// //                                         padding: const EdgeInsets.symmetric(
// //                                             horizontal: 16),
// //                                         decoration: BoxDecoration(
// //                                           border: Border(
// //                                             bottom: BorderSide(
// //                                               color: Palette.kPrimary
// //                                                   .withOpacity(0.2),
// //                                               width: 0.5,
// //                                             ),
// //                                           ),
// //                                         ),
// //                                         child: Row(
// //                                           mainAxisAlignment:
// //                                               MainAxisAlignment.spaceBetween,
// //                                           children: [
// //                                             Row(
// //                                               children: [
// //                                                 SVGAssetsPath.icLocation
// //                                                     .iconImage(
// //                                                         size: 20,
// //                                                         color:
// //                                                             Palette.kPrimary),
// //                                                 8.width,
// //                                                 Text("Gota",
// //                                                     style: primaryTextStyle(
// //                                                         size: 14,
// //                                                         color: Palette
// //                                                             .kPrimary)),
// //                                               ],
// //                                             ),
// //                                             SVGAssetsPath.icArrowRight2
// //                                                 .iconImage(
// //                                               color: Palette.kPrimary,
// //                                               size: 16,
// //                                             ),
// //                                           ],
// //                                         ),
// //                                       ),
// //                                     );
// //                                   },
// //                                 ),
// //                               )
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   );
// //                 },
// //               );
// //             },
// //           );
// //         },
// //       );
// //     },
// //   );
// // }
//
// void showPaymentFailedBottomSheet(
//     {required Function() onTap, required String error, Color? primaryColor}) {
//   showModalBottomSheet(
//     context: AppNavigatorContext.context!,
//     isScrollControlled: true,
//     builder: (context) {
//       return AppBottomSheet(
//         height: 320,
//         title: 'Payment Failed',
//         titleColor: primaryColor,
//         hasBottomButton: true,
//         autoBottomButtonPadding: false,
//         bottomButton: AppBottomNavBar(
//           child: CustomAppButton(
//             onTap: () {
//               HapticFeedback.lightImpact();
//               Navigator.pop(context);
//               onTap();
//             },
//             isNonTraditionalButton: true,
//             nonTraditionalButtonChild: Container(
//               height: 50,
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(AppBorderRadius.m),
//                 border: Border.all(
//                   color: primaryColor ?? Palette.kPrimary,
//                   width: 1.5,
//                 ),
//               ),
//               alignment: Alignment.center,
//               child: Text(
//                 'Try Again',
//                 style: primaryTextStyle(
//                   weight: FontWeight.w500,
//                   color: primaryColor ?? Palette.kPrimary,
//                   size: 14,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         children: [
//           SizedBox(
//             height: 250,
//             // decoration: BoxDecoration(
//             //   image: DecorationImage(
//             //     image: AssetImage(PNGAssetsPath.appointmentCancelled),
//             //     fit: BoxFit.fitHeight,
//             //   ),
//             // ),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SVGAssetsPath.icCreditCard2.iconImage(
//                     size: 100,
//                     color: Palette.kError.shade300,
//                   ),
//                   20.height,
//                   Expanded(
//                     child: Text(
//                       error.isEmpty
//                           ? "Transaction failed, Please try again"
//                           : error,
//                       style: primaryTextStyle(
//                         weight: FontWeight.w500,
//                         color: Palette.kError,
//                         size: 16,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       );
//     },
//   );
// }
//
// void buildInterNotConnectedBottomSheet() {
//   showModalBottomSheet(
//     context: AppNavigatorContext.context!,
//     isScrollControlled: true,
//     builder: (context) {
//       return AppBottomSheet(
//         height: 320,
//         title: 'Internet Not Connected',
//         hasBottomButton: true,
//         autoBottomButtonPadding: false,
//         bottomButton: AppBottomNavBar(
//           child: CustomAppButton(
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
//         ),
//         children: [
//           Container(
//             height: 250,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(PNGAssetsPath.internetNotConnected),
//                 fit: BoxFit.fitHeight,
//               ),
//             ),
//           ),
//         ],
//       );
//     },
//   );
// }
//
// // AppBar Text Style
// TextStyle appBarTextStyle({
//   int? size,
//   Color? color,
//   FontWeight? weight,
//   String? fontFamily,
//   double? letterSpacing,
//   FontStyle? fontStyle,
//   double? wordSpacing,
//   TextDecoration? decoration,
//   TextDecorationStyle? textDecorationStyle,
//   TextBaseline? textBaseline,
//   Color? decorationColor,
//   Color? backgroundColor,
//   double? height,
// }) {
//   return TextStyle(
//     fontSize: size != null ? size.toDouble() : 16,
//     color: color ?? Palette.kNeutral,
//     fontWeight: weight ?? FontWeight.w600,
//     fontFamily: fontFamily ?? fontFamilyBoldGlobal,
//     letterSpacing: letterSpacing,
//     fontStyle: fontStyle,
//     decoration: decoration,
//     decorationStyle: textDecorationStyle,
//     decorationColor: decorationColor,
//     wordSpacing: wordSpacing,
//     textBaseline: textBaseline,
//     backgroundColor: backgroundColor,
//     height: height,
//   );
// }
//
// void copyToClipboard(String text) {
//   HapticFeedback.lightImpact();
//   Clipboard.setData(ClipboardData(text: text));
//   toast("Copied to clipboard");
//   log("Copied to clipboard: $text");
// }
//
// class AppBottomNavBar extends StatelessWidget {
//   final Widget child;
//   final Color? backgroundColor;
//   final Color? shadowColor;
//   final double? spreadRadius;
//   final double? blurRadius;
//   final Offset? offset;
//   final List<BoxShadow>? boxShadow;
//   final double? startingHeight;
//   final double? endingHeight;
//
//   const AppBottomNavBar({
//     super.key,
//     required this.child,
//     this.backgroundColor,
//     this.shadowColor,
//     this.spreadRadius,
//     this.blurRadius,
//     this.offset,
//     this.boxShadow,
//     this.startingHeight,
//     this.endingHeight,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: backgroundColor ?? Palette.kNeutral,
//         boxShadow: boxShadow ??
//             [
//               BoxShadow(
//                 color: shadowColor ?? Colors.black.withOpacity(0.1),
//                 spreadRadius: spreadRadius ?? 1,
//                 blurRadius: blurRadius ?? 10,
//                 offset: offset ?? const Offset(0, -1),
//               ),
//             ],
//       ),
//       child: AnimatedScrollView(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(height: startingHeight ?? 15),
//           child.paddingSymmetric(horizontal: 20),
//           SizedBox(height: endingHeight ?? (isIOS ? 30 : 15)),
//         ],
//       ),
//     );
//   }
//
//   String buildFormattedDateText(DateTime? selectedDate,
//       {bool isWithDay = false, bool isWithTime = false}) {
//     log("Selected Date: $selectedDate");
//     if (selectedDate == null) {
//       return "Select Date";
//     }
//     if (isWithDay) {
//       return DateFormat.MMMMEEEEd().format(selectedDate);
//     }
//     if (isWithTime) {
//       return DateFormat.yMMMMd().add_jm().format(selectedDate);
//     }
//     return DateFormat.yMMMMd().format(selectedDate);
//   }
//
// // Future<String> getPdfOrImageThumbnail({
// //   required FileType fileType,
// //   required String filePath,
// //   required bool isNetworkFile,
// // }) async {
// //   String thumbnailPath = '';
// //   if (fileType == FileType.PDF) {
// //     final document = isNetworkFile
// //         ? await PDFDocument.fromURL(filePath)
// //         : await PDFDocument.fromFile(File(filePath));
// //
// //     final pdfPage = await document.get(page: 1);
// //     thumbnailPath = pdfPage.imgPath ?? '';
// //   } else {
// //     thumbnailPath = filePath;
// //   }
// //
// //   return thumbnailPath;
// // }
//
//   setStatusBarFontColorToDark() {
//     SystemChrome.setSystemUIOverlayStyle(
//       const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         statusBarIconBrightness: Brightness.dark,
//         statusBarBrightness: Brightness.light,
//       ),
//     );
//   }
//
//   setStatusBarFontColorToLight() {
//     SystemChrome.setSystemUIOverlayStyle(
//       const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         statusBarIconBrightness: Brightness.light,
//         statusBarBrightness: Brightness.dark,
//       ),
//     );
//   }
// }