// import 'package:aima/app/common/constants/assets_path.dart';
// import 'package:aima/app/common/utils/common_base.dart';
// import 'package:flutter/material.dart';
// import 'package:nb_utils/nb_utils.dart';
//
// /// Callback function signature for rating change events.
// typedef RatingChangeCallback = void Function(double rating);
//
// /// A widget for displaying and interacting with a rating bar.
// class CustomRatingBarWidget extends StatefulWidget {
//   /// The initial rating value.
//   final double rating;
//
//   /// The total number of rating items.
//   final int itemCount;
//
//   /// Callback function for when the rating changes.
//   final RatingChangeCallback? onRatingChanged;
//
//   /// The color of active rating items.
//   final Color? activeColor;
//
//   /// The color of inactive rating items.
//   final Color? inActiveColor;
//
//   /// The size of each rating item.
//   final double size;
//
//   /// Flag indicating whether half ratings are allowed.
//   final bool allowHalfRating;
//
//   /// The icon data for filled rating items.
//   final IconData? filledIconData;
//
//   /// The icon data for half-filled rating items.
//   final IconData? halfFilledIconData;
//
//   /// The default icon data for empty rating items.
//   final IconData? defaultIconData;
//
//   /// The spacing between rating items.
//   final double spacing;
//
//   /// Flag indicating whether the rating bar is disabled.
//   final bool disable;
//
//   /// Flag indicating whether to show the label below the stars.
//   final bool showRatingLabel;
//
//   CustomRatingBarWidget({
//     this.itemCount = 5,
//     this.spacing = 2.0,
//     this.rating = 0.0,
//     this.defaultIconData,
//     required this.onRatingChanged,
//     this.activeColor = Colors.yellow,
//     this.inActiveColor,
//     this.size = 18,
//     this.filledIconData,
//     this.halfFilledIconData,
//     this.allowHalfRating = false,
//     this.disable = false,
//     this.showRatingLabel = false,
//     super.key,
//   });
//
//   @override
//   _RatingBarWidgetState createState() => _RatingBarWidgetState();
// }
//
// class _RatingBarWidgetState extends State<CustomRatingBarWidget> {
//   /// Define labels and colors for each rating level
//   String getRatingLabel(double rating) {
//     if (rating <= 1) return "Very Bad";
//     if (rating <= 2) return "Bad";
//     if (rating <= 3) return "Okay";
//     if (rating <= 4) return "Good";
//     return "Excellent";
//   }
//
//   Color getRatingLabelColor(double rating) {
//     if (rating <= 1) return Colors.red.shade400;
//     if (rating <= 2) return Colors.orange;
//     if (rating <= 3) return Colors.amber.shade600;
//     if (rating <= 4) return Colors.lightGreen.shade600;
//     return Colors.green.shade800;
//   }
//
//   /// Build rating bar widget
//   Widget _buildItem(BuildContext context, int index) {
//     Widget icon;
//     if (index >= widget.rating) {
//       icon = (SVGAssetsPath.icStar).iconImage(
//         color: widget.inActiveColor ?? Colors.grey,
//         size: widget.size,
//       );
//     } else if (index > widget.rating - (widget.allowHalfRating ? 0.5 : 1.0) &&
//         index < widget.rating) {
//       icon = (SVGAssetsPath.icStar).iconImage(
//         color: widget.activeColor ?? Colors.grey,
//         size: widget.size,
//       );
//     } else {
//       icon = (SVGAssetsPath.icStarFilled).iconImage(
//         color: Colors.amber,
//         size: widget.size,
//       );
//     }
//
//     return GestureDetector(
//       onTap: () {
//         double newRating;
//         if (index == 0 && widget.rating == 1.0) {
//           // Toggle off the first star if it's already selected
//           newRating = 0.0;
//         } else {
//           // Set the rating to the tapped index + 1
//           newRating = index + 1.0;
//         }
//
//         if (widget.onRatingChanged != null) {
//           widget.onRatingChanged!(newRating);
//         }
//       },
//       onHorizontalDragUpdate: (dragDetails) {
//         RenderBox box = context.findRenderObject() as RenderBox;
//         var _pos = box.globalToLocal(dragDetails.globalPosition);
//
//         var i = _pos.dx / widget.size;
//         var newRating = widget.allowHalfRating ? i : i.round().toDouble();
//         newRating = newRating.clamp(0.0, widget.itemCount.toDouble());
//
//         if (widget.onRatingChanged != null) {
//           widget.onRatingChanged!(newRating);
//         }
//       },
//       child: icon,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         IgnorePointer(
//           ignoring: widget.disable,
//           child: Wrap(
//             alignment: WrapAlignment.start,
//             spacing: widget.spacing,
//             children: List.generate(
//               widget.itemCount,
//               (index) => _buildItem(context, index),
//             ),
//           ),
//         ),
//         AnimatedSize(
//           duration: const Duration(milliseconds: 300),
//           reverseDuration: const Duration(milliseconds: 300),
//           child: AnimatedSwitcher(
//             duration: const Duration(milliseconds: 500),
//             transitionBuilder: (child, animation) => FadeTransition(
//               opacity: animation,
//               child: child,
//             ),
//             child: (widget.showRatingLabel && widget.rating > 0)
//                 ? Text(
//                     getRatingLabel(widget.rating),
//                     key: ValueKey(widget.rating),
//                     // Ensure the widget changes are recognized
//                     style: primaryTextStyle(
//                       color: getRatingLabelColor(widget.rating),
//                       size: 12,
//                       weight: FontWeight.w600,
//                     ),
//                   ).paddingTop(2)
//                 : const SizedBox.shrink(
//                     key: ValueKey('empty'),
//                   ), // Provide a unique key for the empty state
//           ),
//         ),
//       ],
//     );
//   }
// }
