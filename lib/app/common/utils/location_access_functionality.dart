// import 'dart:io';
// import 'package:aima/app/common/constants/assets_path.dart';
// import 'package:aima/app/common/constants/border_radius.dart';
// import 'package:aima/app/common/constants/end_points.dart';
// import 'package:aima/app/common/theme/palette.dart';
// import 'package:aima/app/common/utils/common_base.dart';
// import 'package:aima/app/common/widgets/app_bottom_sheet.dart';
// import 'package:aima/app/common/widgets/custom_app_buttons.dart';
// import 'package:aima/main.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:location/location.dart' as locate;
// import 'package:nb_utils/nb_utils.dart';
// import 'package:services/api_exception_handler.dart';
// import 'package:services/api_services.dart';
// import 'package:services/connection_manager.dart';
// import 'package:services/location_manager.dart';
//
// enum LocationPermissionAndAccuracyStatus {
//   denied,
//   deniedForever,
//   unableToDetermine,
//   reduced,
//   preciseAndEnabled,
// }
//
// class LocationAccessFunctionality {
//   String _fetchedAddress = '';
//   double _lat = 0;
//   double _long = 0;
//   String _placeId = '';
//   String _addressStatus = '';
//   String _premise = '';
//   String _subLocality = '';
//   String _locality = '';
//
//   double get lat => _lat;
//
//   double get long => _long;
//
//   String get placeId => _placeId;
//
//   String get addressStatus => _addressStatus;
//
//   String get fetchedAddress => _fetchedAddress;
//
//   String get premise => _premise;
//
//   String get subLocality => _subLocality;
//
//   String get locality => _locality;
//
//   // Check if location services are enabled
//   Future<bool> checkLocationServiceAvailable() async {
//     // return await Geolocator.isLocationServiceEnabled();
//     locate.Location location = locate.Location();
//     bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!isLocationServiceEnabled) {
//       isLocationServiceEnabled = await location.requestService();
//     }
//     return isLocationServiceEnabled;
//   }
//
//   //   // Check if location services are enabled
//   //   Future<bool> checkLocationServiceAvailable() async {
//   //     return await Geolocator.isLocationServiceEnabled();
//   //   }
//
//   Future<LocationPermissionAndAccuracyStatus>
//       getLocationPermissionStatus() async {
//     LocationPermission locationPermission = LocationPermission.denied;
//
//     locationPermission = await Geolocator.checkPermission();
//
//     if (locationPermission == LocationPermission.denied) {
//       return LocationPermissionAndAccuracyStatus.denied;
//     }
//
//     if (locationPermission == LocationPermission.deniedForever) {
//       return LocationPermissionAndAccuracyStatus.deniedForever;
//     }
//
//     if (locationPermission == LocationPermission.unableToDetermine) {
//       return LocationPermissionAndAccuracyStatus.unableToDetermine;
//     }
//
//     if (locationPermission == LocationPermission.always ||
//         locationPermission == LocationPermission.whileInUse) {
//       LocationAccuracyStatus currentAccuracy =
//           await Geolocator.getLocationAccuracy();
//       if (currentAccuracy != LocationAccuracyStatus.precise) {
//         return LocationPermissionAndAccuracyStatus.reduced;
//       } else {
//         return LocationPermissionAndAccuracyStatus.preciseAndEnabled;
//       }
//     }
//
//     return LocationPermissionAndAccuracyStatus.deniedForever;
//   }
//
//   // Check and request location permission
//   Future<LocationPermissionAndAccuracyStatus> checkLocationPermission() async {
//     LocationPermission locationPermission = LocationPermission.denied;
//
//     locationPermission = await Geolocator.checkPermission();
//
//     if (locationPermission == LocationPermission.denied) {
//       locationPermission = await Geolocator.requestPermission();
//       if (locationPermission == LocationPermission.denied) {
//         locationPermission = await Geolocator.requestPermission();
//         return LocationPermissionAndAccuracyStatus.denied;
//       }
//     }
//
//     if (locationPermission == LocationPermission.deniedForever) {
//       return LocationPermissionAndAccuracyStatus.deniedForever;
//     }
//
//     if (locationPermission == LocationPermission.unableToDetermine) {
//       return LocationPermissionAndAccuracyStatus.unableToDetermine;
//     }
//
//     if (locationPermission == LocationPermission.always ||
//         locationPermission == LocationPermission.whileInUse) {
//       LocationAccuracyStatus currentAccuracy =
//           await Geolocator.getLocationAccuracy();
//       if (currentAccuracy != LocationAccuracyStatus.precise) {
//         if (Platform.isIOS) {
//           currentAccuracy = await Geolocator.requestTemporaryFullAccuracy(
//               purposeKey: "LocationAccuracyPurposeKey");
//         }
//         if (currentAccuracy != LocationAccuracyStatus.precise) {
//           return LocationPermissionAndAccuracyStatus.reduced;
//         } else {
//           return LocationPermissionAndAccuracyStatus.preciseAndEnabled;
//         }
//       } else {
//         return LocationPermissionAndAccuracyStatus.preciseAndEnabled;
//       }
//     }
//     return LocationPermissionAndAccuracyStatus.deniedForever;
//   }
//
//   // Fetch the current location based on permissions
//   Future<Position?> getCurrentLocation() async {
//     log("Getting user location");
//
//     // Check if location service is enabled
//     bool hasLocationServiceEnabled = await checkLocationServiceAvailable();
//     if (!hasLocationServiceEnabled) {
//       _buildLocationServiceDisabledBottomSheet();
//       return null;
//     }
//
//     // Check location permissions and accuracy
//     LocationPermissionAndAccuracyStatus permissionAndAccuracyStatus =
//         await checkLocationPermission();
//     switch (permissionAndAccuracyStatus) {
//       case LocationPermissionAndAccuracyStatus.deniedForever:
//         _buildLocationPermissionDeniedForeverBottomSheet(); // Callback for denied forever
//         return null;
//
//       case LocationPermissionAndAccuracyStatus.reduced:
//         _buildLocationAccuracyReducedBottomSheet(); // Callback for reduced accuracy
//         return null;
//
//       case LocationPermissionAndAccuracyStatus.preciseAndEnabled:
//         // If permission is granted and accuracy is precise, get the location
//         try {
//           return await Geolocator.getCurrentPosition(
//             desiredAccuracy: LocationAccuracy.high,
//           );
//         } catch (e) {
//           // Handle failure to get location
//           return null;
//         }
//
//       default:
//         return null;
//     }
//   }
//
//   // // Fetch the address details based on latitude and longitude
//   // Future<void> getAddressDetails({
//   //   required String latitude,
//   //   required String longitude,
//   // }) async {
//   //   GeocodeModel geocodeResponse;
//   //
//   //   if (await ConnectionManager().isConnected() == false) {
//   //     buildInterNotConnectedBottomSheet();
//   //     return;
//   //   }
//   //
//   //   final Map<String, dynamic> response = await APIServices.getEndPoint(
//   //     endPoint: EndPoints.googleGetAddressFromLatLongEndPoint(
//   //         latitude: latitude, longitude: longitude),
//   //   );
//   //
//   //   APIResponseHandler.handleResponse(
//   //     response: response,
//   //     onSuccess: () {
//   //       geocodeResponse = GeocodeModel.fromJson(response['responseBody']);
//   //       log("Location LatLong: ${geocodeResponse.results?[0].geometry?.location}");
//   //       log("Location Address: ${geocodeResponse.results?[0].formattedAddress}");
//   //       log("Location PlaceId: ${geocodeResponse.results?[0].placeId}");
//   //       _fetchedAddress = geocodeResponse.results?[0].formattedAddress ?? '';
//   //       _lat = geocodeResponse.results?[0].geometry?.location?.lat ?? 0;
//   //       _long = geocodeResponse.results?[0].geometry?.location?.lng ?? 0;
//   //       _placeId = geocodeResponse.results?[0].placeId ?? '';
//   //       _addressStatus = geocodeResponse.status ?? '';
//   //
//   //       bool premiseFound = false;
//   //       bool subLocalityFound = false;
//   //       bool localityFound = false;
//   //
//   //       geocodeResponse.results?[0].addressComponents?.forEach((element) {
//   //         if (!premiseFound &&
//   //             (element.types?.contains("premise") == true ||
//   //                 element.types?.contains("establishment") == true)) {
//   //           _premise = element.longName ?? '';
//   //           premiseFound = true;
//   //         }
//   //
//   //         if (!subLocalityFound &&
//   //             element.types?.contains("sublocality") == true) {
//   //           _subLocality = element.longName ?? '';
//   //           subLocalityFound = true;
//   //         }
//   //
//   //         if (!localityFound && element.types?.contains("locality") == true) {
//   //           _locality = element.longName ?? '';
//   //           localityFound = true;
//   //         }
//   //       });
//   //     },
//   //     onFailure: ({required errorMessage, required statusCode}) {
//   //       return null;
//   //     },
//   //   );
//   //
//   //   // try {
//   //   //   if (response["statusCode"] == 200) {
//   //   //     GeoCodingModel geoCodingModel =
//   //   //         GeoCodingModel.fromJson(response['responseBody']);
//   //   //     log("GeoCodingModel: $GeoCodingModel");
//   //   //     log("Location LatLong: ${geoCodingModel.results[0].geometry.location}");
//   //   //
//   //   //     searchedLocationDetails = LocationDetails(
//   //   //       latitude: geoCodingModel.results[0].geometry.location.lat,
//   //   //       longitude: geoCodingModel.results[0].geometry.location.lng,
//   //   //       placeId: geoCodingModel.results[0].placeId,
//   //   //       address: geoCodingModel.results[0].formattedAddress,
//   //   //       locationDetailsType: LocationDetailsType.WHERE_FROM,
//   //   //       dateTime: DateTime.now(),
//   //   //     );
//   //   //     int key = await saveData<LocationDetails>(
//   //   //       BoxName.SEARCHED_LOCATIONS,
//   //   //       searchedLocationDetails!,
//   //   //     );
//   //   //     storeBoxKey(BoxName.SEARCHED_LOCATIONS, key);
//   //   //
//   //   //     whereFromController.clear();
//   //   //     whereFromController.text = geoCodingModel.results[0].formattedAddress;
//   //   //     FocusScope.of(context).nextFocus();
//   //   //     FocusScope.of(context).nextFocus();
//   //   //     clearPredictions();
//   //   //     notifyListeners();
//   //   //   } else {
//   //   //     toast(msg: "Please try again");
//   //   //   }
//   //   // } catch (e) {
//   //   //   log("Error parsing GeoCodingModel: $e");
//   //   //   try {
//   //   //     if (response["statusCode"] == 200) {
//   //   //       GeoCodingModel geoCodingModel =
//   //   //           GeoCodingModel.fromJson(response['responseBody']);
//   //   //       log("GeoCodingModel: $GeoCodingModel");
//   //   //       log("Location LatLong: ${geoCodingModel.results[0].geometry.location}");
//   //   //
//   //   //       searchedLocationDetails = LocationDetails(
//   //   //         latitude: geoCodingModel.results[0].geometry.location.lat,
//   //   //         longitude: geoCodingModel.results[0].geometry.location.lng,
//   //   //         placeId: geoCodingModel.results[0].placeId,
//   //   //         address: geoCodingModel.results[0].formattedAddress,
//   //   //         locationDetailsType: LocationDetailsType.WHERE_FROM,
//   //   //         dateTime: DateTime.now(),
//   //   //       );
//   //   //       int key = await saveData<LocationDetails>(
//   //   //         BoxName.SEARCHED_LOCATIONS,
//   //   //         searchedLocationDetails!,
//   //   //       );
//   //   //       storeBoxKey(BoxName.SEARCHED_LOCATIONS, key);
//   //   //
//   //   //       whereFromController.clear();
//   //   //       whereFromController.text = geoCodingModel.results[0].formattedAddress;
//   //   //       FocusScope.of(context).nextFocus();
//   //   //       FocusScope.of(context).nextFocus();
//   //   //       clearPredictions();
//   //   //       notifyListeners();
//   //   //     } else {
//   //   //       toast(msg: "Please try again");
//   //   //     }
//   //   //   } catch (e) {
//   //   //     toast(msg: "Enter location manually");
//   //   //   }
//   //   // }
//   // }
//   //
//   // // Address autocomplete based on user query
//   // Future<List<Prediction>> placeAutocomplete({
//   //   required BuildContext context,
//   //   required String query,
//   // }) async {
//   //   log("placeAutocomplete called");
//   //   List<Prediction> predictions = [];
//   //
//   //   if (await ConnectionManager().isConnected() == false) {
//   //     buildInterNotConnectedBottomSheet();
//   //     return predictions;
//   //   }
//   //
//   //   final Map<String, dynamic> response = await APIServices.getEndPoint(
//   //     endPoint: EndPoints.googlePlacesAutocompleteEndPoint(location: query),
//   //   );
//   //
//   //   APIResponseHandler.handleResponse(
//   //     response: response,
//   //     onSuccess: () {
//   //       log("Place Autocomplete Response: ${response['responseBody']}");
//   //       PlaceAutocompleteModel placesModel =
//   //           PlaceAutocompleteModel.fromJson(response["responseBody"]);
//   //       if (placesModel.predictions.isEmpty) {
//   //         toast("No such place found");
//   //         predictions = placesModel.predictions;
//   //       }
//   //
//   //       // Filter predictions to only include those in India
//   //       List<Prediction> indiaPredictions =
//   //           placesModel.predictions.where((prediction) {
//   //         // Assuming the last term in the 'terms' array is the country
//   //         // Adjust this logic if the API response structure is different
//   //         return prediction.terms.last.value == "India";
//   //       }).toList();
//   //
//   //       if (indiaPredictions.isEmpty) {
//   //         toast("No such place found");
//   //       }
//   //
//   //       predictions = indiaPredictions;
//   //     },
//   //     onFailure: ({required errorMessage, required statusCode}) {
//   //       log("Error: $errorMessage");
//   //       log("Status Code: $statusCode");
//   //       return predictions;
//   //     },
//   //   );
//   //   return predictions;
//   // }
//   //
//   // Future<PlaceDetailsModel> placeDetails({
//   //   required String addressDescription,
//   //   required BuildContext context,
//   //   required String placeId,
//   // }) async {
//   //   PlaceDetailsModel placeDetailsModel = PlaceDetailsModel();
//   //
//   //   if (await ConnectionManager().isConnected() == false) {
//   //     buildInterNotConnectedBottomSheet();
//   //     return placeDetailsModel;
//   //   }
//   //
//   //   final Map<String, dynamic> response = await APIServices.getEndPoint(
//   //     endPoint: EndPoints.googlePlacesDetailsEndPoint(placeId: placeId),
//   //   );
//   //
//   //   APIResponseHandler.handleResponse(
//   //     response: response,
//   //     onSuccess: () {
//   //       placeDetailsModel =
//   //           PlaceDetailsModel.fromJson(response["responseBody"]);
//   //       log("PlaceDetailsModel: $placeDetailsModel");
//   //       log("Location LatLong: ${placeDetailsModel.result?.geometry?.location ?? ''}");
//   //     },
//   //     onFailure: ({required errorMessage, required statusCode}) {
//   //       log("Error: $errorMessage");
//   //       log("Status Code: $statusCode");
//   //       return placeDetailsModel;
//   //     },
//   //   );
//   //
//   //   return placeDetailsModel;
//   // }
//
//   void _buildLocationServiceDisabledBottomSheet() {
//     showModalBottomSheet(
//       context: AppNavigatorContext.context!,
//       isScrollControlled: true,
//       builder: (context) {
//         return AppBottomSheet(
//           height: 320,
//           title: 'Location Services Disabled',
//           hasBottomButton: true,
//           autoBottomButtonPadding: false,
//           bottomButton: AppBottomNavBar(
//             child: CustomAppButton(
//               onTap: () {
//                 HapticFeedback.lightImpact();
//                 LocationManager.openSettingsForApp();
//                 Navigator.pop(context);
//               },
//               isNonTraditionalButton: true,
//               nonTraditionalButtonChild: Container(
//                 height: 50,
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(AppBorderRadius.m),
//                   border: Border.all(
//                     color: Palette.kPrimary,
//                     width: 1.5,
//                   ),
//                 ),
//                 alignment: Alignment.center,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SVGAssetsPath.icSettings.iconImage(
//                       color: Palette.kPrimary,
//                       size: 20,
//                     ),
//                     10.width,
//                     Text(
//                       'Grant Permission in Settings',
//                       style: primaryTextStyle(
//                         weight: FontWeight.w500,
//                         color: Palette.kPrimary,
//                         size: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           children: [
//             Container(
//               height: 250,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(PNGAssetsPath.locationAccessDenied2),
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
//   void _buildLocationPermissionDeniedForeverBottomSheet() {
//     showModalBottomSheet(
//       context: AppNavigatorContext.context!,
//       isScrollControlled: true,
//       builder: (context) {
//         return AppBottomSheet(
//           height: 320,
//           title: 'Location Permission Denied',
//           hasBottomButton: true,
//           autoBottomButtonPadding: false,
//           bottomButton: AppBottomNavBar(
//             child: CustomAppButton(
//               onTap: () {
//                 HapticFeedback.lightImpact();
//                 LocationManager.openSettingsForApp();
//                 Navigator.pop(context);
//               },
//               isNonTraditionalButton: true,
//               nonTraditionalButtonChild: Container(
//                 height: 50,
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(AppBorderRadius.m),
//                   border: Border.all(
//                     color: Palette.kPrimary,
//                     width: 1.5,
//                   ),
//                 ),
//                 alignment: Alignment.center,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SVGAssetsPath.icSettings.iconImage(
//                       color: Palette.kPrimary,
//                       size: 20,
//                     ),
//                     10.width,
//                     Text(
//                       'Grant Permission in Settings',
//                       style: primaryTextStyle(
//                         weight: FontWeight.w500,
//                         color: Palette.kPrimary,
//                         size: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           children: [
//             Container(
//               height: 250,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(PNGAssetsPath.locationAccessDenied2),
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
//   void _buildLocationAccuracyReducedBottomSheet() {
//     showModalBottomSheet(
//       context: AppNavigatorContext.context!,
//       isScrollControlled: true,
//       builder: (context) {
//         return AppBottomSheet(
//           height: 480,
//           title: 'Location Accuracy Required',
//           hasBottomButton: true,
//           autoBottomButtonPadding: false,
//           bottomButton: AppBottomNavBar(
//             child: CustomAppButton(
//               onTap: () {
//                 HapticFeedback.lightImpact();
//                 LocationManager.openSettingsForApp();
//                 Navigator.pop(context);
//               },
//               isNonTraditionalButton: true,
//               nonTraditionalButtonChild: Container(
//                 height: 50,
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(AppBorderRadius.m),
//                   border: Border.all(
//                     color: Palette.kPrimary,
//                     width: 1.5,
//                   ),
//                 ),
//                 alignment: Alignment.center,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SVGAssetsPath.icSettings.iconImage(
//                       color: Palette.kPrimary,
//                       size: 20,
//                     ),
//                     10.width,
//                     Text(
//                       'Grant Permission in Settings',
//                       style: primaryTextStyle(
//                         weight: FontWeight.w500,
//                         color: Palette.kPrimary,
//                         size: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           children: [
//             Container(
//               height: 250,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(PNGAssetsPath.locationAccessDenied),
//                   fit: BoxFit.fitHeight,
//                 ),
//               ),
//             ),
//             if (Platform.isAndroid) ...[
//               10.height,
//               const Text("Location Access Settings:"),
//               5.height,
//               SizedBox(
//                 width: context.width(),
//                 child: RichTextWidget(
//                   maxLines: 5,
//                   list: [
//                     TextSpan(
//                       text: 'Grant Permission in Settings',
//                       style: primaryTextStyle(
//                         size: 14,
//                         weight: FontWeight.w500,
//                         color: Palette.kPrimary,
//                       ),
//                     ),
//                     TextSpan(
//                       text: ' > ',
//                       style: primaryTextStyle(
//                         size: 14,
//                         weight: FontWeight.w400,
//                       ),
//                     ),
//                     TextSpan(
//                       text: 'Permissions',
//                       style: primaryTextStyle(
//                         size: 14,
//                         weight: FontWeight.w500,
//                         color: Palette.kPrimary,
//                       ),
//                     ),
//                     TextSpan(
//                       text: ' > ',
//                       style: primaryTextStyle(
//                         size: 14,
//                         weight: FontWeight.w400,
//                       ),
//                     ),
//                     TextSpan(
//                       text: 'Location',
//                       style: primaryTextStyle(
//                         size: 14,
//                         weight: FontWeight.w500,
//                         color: Palette.kPrimary,
//                       ),
//                     ),
//                     TextSpan(
//                       text: ' > ',
//                       style: primaryTextStyle(
//                         size: 14,
//                         weight: FontWeight.w400,
//                       ),
//                     ),
//                     TextSpan(
//                       text: 'Allow all the time',
//                       style: primaryTextStyle(
//                         size: 14,
//                         weight: FontWeight.w500,
//                         color: Palette.kPrimary,
//                       ),
//                     ),
//                     TextSpan(
//                       text: ' or ',
//                       style: primaryTextStyle(
//                         size: 14,
//                         weight: FontWeight.w400,
//                       ),
//                     ),
//                     TextSpan(
//                       text: 'Allow only while using the app',
//                       style: primaryTextStyle(
//                         size: 14,
//                         weight: FontWeight.w500,
//                         color: Palette.kPrimary,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               10.height,
//               const Text("Location Accuracy Settings:"),
//               5.height,
//               SizedBox(
//                 width: context.width(),
//                 child: RichTextWidget(
//                   maxLines: 5,
//                   list: [
//                     TextSpan(
//                       text: 'Grant Permission in Settings',
//                       style: primaryTextStyle(
//                         size: 14,
//                         weight: FontWeight.w500,
//                         color: Palette.kPrimary,
//                       ),
//                     ),
//                     TextSpan(
//                       text: ' > ',
//                       style: primaryTextStyle(
//                         size: 14,
//                         weight: FontWeight.w400,
//                       ),
//                     ),
//                     TextSpan(
//                       text: 'Permissions',
//                       style: primaryTextStyle(
//                         size: 14,
//                         weight: FontWeight.w500,
//                         color: Palette.kPrimary,
//                       ),
//                     ),
//                     TextSpan(
//                       text: ' > ',
//                       style: primaryTextStyle(
//                         size: 14,
//                         weight: FontWeight.w400,
//                       ),
//                     ),
//                     TextSpan(
//                       text: 'Location',
//                       style: primaryTextStyle(
//                         size: 14,
//                         weight: FontWeight.w500,
//                         color: Palette.kPrimary,
//                       ),
//                     ),
//                     TextSpan(
//                       text: ' > ',
//                       style: primaryTextStyle(
//                         size: 14,
//                         weight: FontWeight.w400,
//                       ),
//                     ),
//                     TextSpan(
//                       text: 'Set "Use precise location" to On',
//                       style: primaryTextStyle(
//                         size: 14,
//                         weight: FontWeight.w500,
//                         color: Palette.kPrimary,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ],
//         );
//       },
//     );
//   }
// }
