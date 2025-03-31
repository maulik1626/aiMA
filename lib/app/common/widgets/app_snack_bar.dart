// import 'dart:io';
//
// import 'package:aima/app/common/constants/assets_path.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:nb_utils/nb_utils.dart';
//
// void showAppSnackBar(BuildContext context,
//     {required String message, int durationSeconds = 5}) {
//   // Create an overlay entry
//   final overlay = Overlay.of(context);
//   final overlayEntry = OverlayEntry(
//     builder: (context) {
//       return Positioned(
//         top: 0, // Position at the top of the screen
//         left: 0,
//         right: 0,
//         child: Material(
//           color: Colors.transparent,
//           child: _AppSnackBarTop(
//             message: message,
//             durationSeconds: durationSeconds,
//           ),
//         ),
//       );
//     },
//   );
//
//   // Insert the overlay entry
//   overlay.insert(overlayEntry);
//
//   // Remove the overlay after 3 seconds
//   Future.delayed(Duration(seconds: durationSeconds), () {
//     overlayEntry.remove();
//   });
// }
//
// class _AppSnackBarTop extends StatelessWidget {
//   final int durationSeconds;
//   final String message;
//
//   const _AppSnackBarTop({
//     required this.durationSeconds,
//     required this.message,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Blur(
//       // elevation: 4,
//       color: Colors.white70,
//       child: Container(
//         padding: const EdgeInsets.only(left: 16, right: 16),
//         child: SafeArea(
//           bottom: false,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               if (Platform.isAndroid) 5.height,
//               Row(
//                 children: [
//                   Container(
//                     height: 40,
//                     width: 40,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       image: const DecorationImage(
//                         image: AssetImage(launcherIconPath),
//                       ),
//                     ),
//                   ),
//                   8.width,
//                   Expanded(
//                     child: Text(
//                       message,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       textAlign: TextAlign.start,
//                       style: primaryTextStyle(
//                         color: Colors.black,
//                         weight: FontWeight.w500,
//                         size: 14,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               5.height,
//               Container(
//                 height: 3,
//                 width: 40,
//                 decoration: BoxDecoration(
//                   color: Colors.black54,
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               ),
//               5.height,
//             ],
//           ),
//         ),
//       ),
//     )
//         .animate()
//         .slideY(
//       begin: -1,
//       end: 0,
//       duration: const Duration(milliseconds: 300),
//     )
//         .slideY(
//       begin: 0,
//       end: -1,
//       delay: Duration(seconds: durationSeconds - 1),
//       duration: const Duration(milliseconds: 300),
//     );
//   }
// }