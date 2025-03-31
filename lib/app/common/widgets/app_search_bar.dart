// // ignore_for_file: constant_identifier_names
//
// import 'package:animated_text_kit/animated_text_kit.dart' as atk;
// import 'package:aima/app/common/constants/assets_path.dart';
// import 'package:aima/app/common/constants/border_radius.dart';
// import 'package:aima/app/common/theme/palette.dart';
// import 'package:aima/app/common/utils/common_base.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:nb_utils/nb_utils.dart';
// import '../../routes/app_pages.dart';
//
// enum SearchType { CLINIC, GROOMER, PRODUCT, BOOKINGS }
//
// class AppSearchBar extends StatefulWidget {
//   final bool isDisplayOnly;
//   final TextEditingController? searchController;
//   final FocusNode? searchFocus;
//   final bool showClearButton;
//   final bool showShadowOnDisplayMode;
//   final bool showMicButton;
//   final SearchType searchType;
//
//   const AppSearchBar({
//     super.key,
//     required this.isDisplayOnly,
//     required this.searchType,
//     this.searchController,
//     this.showClearButton = true,
//     this.showShadowOnDisplayMode = false,
//     this.showMicButton = false,
//     this.searchFocus,
//   });
//
//   @override
//   State<AppSearchBar> createState() => _AppSearchBarState();
// }
//
// class _AppSearchBarState extends State<AppSearchBar> {
//   @override
//   Widget build(BuildContext context) {
//     if (widget.isDisplayOnly) {
//       return GestureDetector(
//         onTap: () {
//           Navigator.pushNamed(context, Routes.SEARCH);
//         },
//         child: Container(
//           height: 50,
//           margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(AppBorderRadius.m),
//             boxShadow:
//                 widget.showShadowOnDisplayMode ? defaultBoxShadow() : null,
//           ),
//           child: Row(
//             children: [
//               15.width,
//               SVGAssetsPath.icSearch.iconImage(
//                 // color: Palette.kPrimary1000.withOpacity(0.75),
//                 color: Palette.kNeutral.shade700,
//                 height: 20,
//                 width: 20,
//               ),
//               10.width,
//               DefaultTextStyle(
//                 style: secondaryTextStyle(
//                   size: 16,
//                   // color: Palette.kPrimary1000.withOpacity(0.5),
//                   color: Palette.kNeutral.shade600,
//                 ),
//                 child: atk.AnimatedTextKit(
//                   repeatForever: true,
//                   animatedTexts: [
//                     if (widget.searchType == SearchType.CLINIC) atk.TyperAnimatedText("Search by Clinic Name",
//                         speed: const Duration(milliseconds: 150)),
//                     if (widget.searchType == SearchType.CLINIC) atk.TyperAnimatedText("Search by Doctor Name",
//                         speed: const Duration(milliseconds: 150)),
//                     if (widget.searchType == SearchType.GROOMER) atk.TyperAnimatedText("Search by Groomer Name",
//                         speed: const Duration(milliseconds: 150)),
//                     if (widget.searchType == SearchType.GROOMER) atk.TyperAnimatedText("Search for Pet SPA",
//                         speed: const Duration(milliseconds: 150)),
//                     if (widget.searchType == SearchType.GROOMER) atk.TyperAnimatedText("Search by Grooming Services",
//                         speed: const Duration(milliseconds: 150)),
//                     if (widget.searchType == SearchType.PRODUCT) atk.TyperAnimatedText("Search for Cat Food",
//                         speed: const Duration(milliseconds: 150)),
//                     if (widget.searchType == SearchType.PRODUCT) atk.TyperAnimatedText("Search for Dog Leashes",
//                         speed: const Duration(milliseconds: 150)),
//                     if (widget.searchType == SearchType.PRODUCT) atk.TyperAnimatedText("Search for Pet Toys",
//                         speed: const Duration(milliseconds: 150)),
//                     if (widget.searchType == SearchType.PRODUCT) atk.TyperAnimatedText("Search for Pet Medicines",
//                         speed: const Duration(milliseconds: 150)),
//                     if (widget.searchType == SearchType.BOOKINGS) atk.TyperAnimatedText("Search for Bookings",
//                         speed: const Duration(milliseconds: 150)),
//                     if (widget.searchType == SearchType.BOOKINGS) atk.TyperAnimatedText("Search for Appointments",
//                         speed: const Duration(milliseconds: 150)),
//
//
//                   ],
//                 ),
//               ),
//               if (widget.showMicButton) ...[
//                 const Spacer(),
//                 SVGAssetsPath.icDividerVert
//                     .iconImage(height: 20, color: Palette.kNeutral.shade300),
//                 10.width,
//                 SVGAssetsPath.icMicFilled.iconImage(
//                   // color: Palette.kPrimary1000.withOpacity(0.75),
//                   color: Palette.kNeutral.shade700,
//                   height: 20,
//                   width: 20,
//                 ),
//               ],
//               13.width,
//             ],
//           ),
//         ),
//       );
//     }
//     return Container(
//       height: 50,
//       margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(AppBorderRadius.m),
//         boxShadow: defaultBoxShadow(),
//       ),
//       child: Row(
//         children: [
//           Container(
//             height: 50,
//             padding:
//                 const EdgeInsets.only(left: 7.5, right: 5, top: 15, bottom: 15),
//             child: SVGAssetsPath.icBackButtonArrow.iconImage(
//               color: Palette.kNeutral.shade700,
//               height: 27.5,
//               width: 27.5,
//             ),
//           ).onTap(() {
//             Navigator.pop(context);
//           }),
//           Expanded(
//             child: AppTextField(
//               controller: widget.searchController,
//               focus: widget.searchFocus,
//               textFieldType: TextFieldType.OTHER,
//               cursorHeight: 20,
//               maxLines: 1,
//               cursorColor: Palette.kNeutral.shade500,
//               textStyle: primaryTextStyle(
//                 size: 16,
//                 // color: Palette.kPrimary1000.withOpacity(0.75),
//               ),
//               onChanged: (_) {
//                 setState(() {});
//               },
//               keyboardAppearance: Brightness.dark,
//               autoFocus: true,
//               decoration: InputDecoration(
//                 hintText: "Search for Doctors, Groomers, Cat Food, Dog Leashes",
//                 hintStyle: secondaryTextStyle(
//                   size: 16,
//                   // color: Palette.kPrimary1000.withOpacity(0.5),
//                   color: Palette.kNeutral.shade600,
//                 ),
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           10.width,
//           if (widget.searchController != null &&
//               widget.searchController!.text.trim().isNotEmpty &&
//               widget.showClearButton)
//             SVGAssetsPath.icCloseSquareOutlined
//                 .iconImage(
//               color: Palette.kNeutral.shade700,
//               height: 17.5,
//               width: 17.5,
//             )
//                 .onTap(() {
//               HapticFeedback.lightImpact();
//               HapticFeedback.lightImpact();
//               setState(() {
//                 widget.searchController!.clear();
//               });
//             }),
//           10.width,
//           if (widget.showMicButton) ...[
//             SVGAssetsPath.icDividerVert
//                 .iconImage(height: 20, color: Palette.kNeutral.shade300),
//             10.width,
//             SVGAssetsPath.icMicFilled.iconImage(
//               // color: Palette.kPrimary1000.withOpacity(0.75),
//               color: Palette.kNeutral.shade700,
//               height: 20,
//               width: 20,
//             ),
//             13.width,
//           ],
//         ],
//       ),
//     );
//   }
// }
// //
