// import 'package:aima/app/common/constants/assets_path.dart';
// import 'package:aima/app/common/constants/border_radius.dart';
// import 'package:aima/app/common/theme/palette.dart';
// import 'package:aima/app/common/utils/common_base.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:nb_utils/nb_utils.dart';
//
// class AppBottomSheet extends StatelessWidget {
//   final List<Widget> children;
//   final String title;
//   final Widget? titleTrailing;
//   final Widget? titleLeading;
//   final double? height;
//   final double? padding;
//   final Color? backgroundColor;
//   final double? borderRadius;
//   final bool hasSearchBar;
//   final AppTextField? searchBar;
//   final bool hasBottomButton;
//   final Widget? bottomButton;
//   final bool autoBottomButtonPadding;
//   final Color? titleColor;
//
//   const AppBottomSheet({
//     super.key,
//     required this.children,
//     required this.title,
//     this.height,
//     this.padding,
//     this.backgroundColor,
//     this.borderRadius,
//     this.titleTrailing,
//     this.titleLeading,
//     this.hasSearchBar = false,
//     this.searchBar,
//     this.hasBottomButton = false,
//     this.bottomButton,
//     this.autoBottomButtonPadding = true, this.titleColor,
//   }) : assert(!hasSearchBar || searchBar != null,
//             'searchBar cannot be null when hasSearchBar is true');
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           height: height,
//           padding: EdgeInsets.only(
//             top: padding ?? 16,
//             left: padding ?? 16,
//             right: padding ?? 16,
//           ),
//           decoration: BoxDecoration(
//             color: backgroundColor ?? Palette.kNeutral,
//             borderRadius: radiusOnly(
//               topLeft: borderRadius ?? AppBorderRadius.m,
//               topRight: borderRadius ?? AppBorderRadius.m,
//             ),
//           ),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   if (titleLeading != null) titleLeading!,
//                   Expanded(
//                     child: Text(
//                       title,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: boldTextStyle(
//                         size: 16,
//                         color: titleColor ?? Palette.kPrimary,
//                         weight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                   16.width,
//                   titleTrailing ??
//                       SVGAssetsPath.icCloseSquareOutlined
//                           .iconImage(
//                         color: titleColor ?? Palette.kPrimary,
//                         size: 20,
//                       )
//                           .onTap(() {
//                         HapticFeedback.lightImpact();
//                         Navigator.pop(context);
//                       }),
//                 ],
//               ),
//               hasSearchBar
//                   ? padding?.toInt().height ?? 16.height
//                   : padding?.toInt().height ?? 16.height,
//               if (hasSearchBar)
//                 Column(
//                   children: [
//                     searchBar!,
//                     10.height,
//                   ],
//                 ),
//               Expanded(
//                 child: ListView(
//                   scrollDirection: Axis.vertical,
//                   physics: const BouncingScrollPhysics(),
//                   children: [
//                     if (!hasSearchBar) 5.height,
//                     ...children,
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         if (hasBottomButton)
//           autoBottomButtonPadding
//               ? bottomButton!.paddingOnly(
//             top: 20,
//             bottom: isIOS ? 30 : 20,
//           )
//               : bottomButton!,
//       ],
//     );
//   }
// }
