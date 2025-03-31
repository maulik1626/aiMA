// import 'package:aima/app/common/utils/common_base.dart';
// import 'package:flutter/material.dart';
// import 'package:nb_utils/nb_utils.dart';
//
// import '../constants/assets_path.dart';
// import '../theme/palette.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final double? height;
//   final Widget? leading;
//   final Widget? trailing;
//   final String? title;
//   final bool showBackButton;
//   final bool showLeading;
//   final bool showTrailing;
//   final Widget? titleWidget;
//   final Color? backgroundColor;
//   final Function()? onBackButtonTap;
//
//   const CustomAppBar({
//     super.key,
//     this.height,
//     this.leading,
//     this.trailing,
//     this.title,
//     this.showBackButton = true,
//     this.showLeading = true,
//     this.showTrailing = true,
//     this.titleWidget,
//     this.onBackButtonTap, this.backgroundColor,
//   });
//
//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         color: backgroundColor,
//         width: double.infinity,
//         height: height ?? 60.0,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // Leading widget or back button
//             if (showLeading) ...[
//               leading ??
//                   (showBackButton
//                       ? Container(
//                           color: Colors.transparent,
//                           padding: const EdgeInsets.only(
//                             right: 15,
//                             top: 10,
//                             bottom: 10,
//                           ),
//                           child: SVGAssetsPath.icBackButtonArrow
//                               .iconImage(size: 24, color: Palette.kWhite),
//                         ).onTap(
//                           onBackButtonTap ??
//                               () {
//                                 Navigator.of(context).pop();
//                               },
//                         )
//                       : const SizedBox.shrink()),
//             ] else ...[
//               const SizedBox(width: 24),
//             ],
//
//             // Title or custom title widget
//             if (titleWidget != null) Expanded(
//               child: Center(
//                 child: titleWidget ??
//                     Text(
//                       title ?? '',
//                       style: boldTextStyle(
//                         size: 16,
//                         weight: FontWeight.w700,
//                         color: Palette.kWhite,
//                       ),
//                     ),
//               ),
//             ),
//
//             // Trailing widget
//             if (showTrailing) ...[
//               trailing ?? const SizedBox(width: 24),
//             ] else ...[
//               const SizedBox(width: 24),
//               // Empty space to keep the layout balanced
//             ],
//           ],
//         ).paddingSymmetric(horizontal: 20),
//       ),
//     );
//   }
// }
