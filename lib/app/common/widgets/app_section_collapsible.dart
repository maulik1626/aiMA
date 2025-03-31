import 'package:aima/app/common/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CollapsibleSection extends StatefulWidget {
  final Widget titleSection;
  final Widget childSection;
  final Widget? bottomSection;
  final bool isExpandedInitially;
  final double? titleHorizontalPadding;
  final double? sectionHorizontalMargin;
  final double? sectionBorderRadius;
  final Color? sectionColor;
  final Color? sectionBorderColor;
  final bool allowCollapsing;
  final bool allowExpanding;
  final double? childSectionVerticalPadding;
  final EdgeInsets? titlePadding;
  final Decoration? decoration;

  const CollapsibleSection({
    super.key,
    required this.titleSection,
    required this.childSection,
    this.bottomSection,
    this.isExpandedInitially = true,
    this.titleHorizontalPadding,
    this.sectionHorizontalMargin,
    this.sectionBorderRadius,
    this.sectionColor,
    this.sectionBorderColor,
    this.allowCollapsing = true,
    this.childSectionVerticalPadding,
    this.allowExpanding = true, this.titlePadding, this.decoration,
  });

  @override
  State<CollapsibleSection> createState() => _CollapsibleSectionState();
}

class _CollapsibleSectionState extends State<CollapsibleSection>
    with SingleTickerProviderStateMixin {
  late bool isExpanded;
  late AnimationController _controller;
  late Animation<double> _heightFactor;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpandedInitially;
    isExpanded = widget.allowCollapsing ? isExpanded : true;

    // Animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    // Height factor animation
    _heightFactor = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );

    // Opacity animation
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    // Start animation based on initial state
    if (isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
      if (isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal: widget.sectionHorizontalMargin ?? 10),
          padding: EdgeInsets.only(
              top: 10, bottom: widget.bottomSection == null ? 10 : 0),
          decoration: widget.decoration ?? BoxDecoration(
            color: widget.sectionColor ?? Colors.white,
            border: Border.all(
              color: widget.sectionBorderColor ?? Colors.transparent,
            ),
            borderRadius:
                BorderRadius.circular(widget.sectionBorderRadius ?? 12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Section (Always Visible)
              // Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 children: [
              //                   Text(
              //                     widget.title,
              //                     style: boldTextStyle(
              //                       size: 14,
              //                       color: Palette.kNeutral.shade700,
              //                     ),
              //                   ),
              //                   Icon(isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              //                       color: Palette.kNeutral.shade700),
              //                 ],
              //               ).paddingSymmetric(horizontal: 10).onTap(() {
              //                 setState(() {
              //                   isExpanded = !isExpanded;
              //                 });
              //               }),
              Padding(
                padding: widget.titlePadding ?? EdgeInsets.symmetric(horizontal: widget.titleHorizontalPadding ?? 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: widget.titleSection),
                    Icon(
                      isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: widget.allowCollapsing && widget.allowExpanding
                          ? Palette.kNeutral.shade700
                          : Colors.transparent,
                    ),
                  ],
                )
                    .onTap(widget.allowCollapsing && widget.allowExpanding ? _toggleExpanded : () {}),
              ),

              // Collapsible Child Section with Smooth Height and Fade
              ClipRect(
                child: Align(
                  heightFactor: _heightFactor.value,
                  child: Opacity(
                    opacity: _opacity.value,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: widget.childSectionVerticalPadding ?? 8.0),
                      child: widget.childSection,
                    ),
                  ),
                ),
              ),

              // Bottom Section (Always Visible)
              widget.bottomSection ?? const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
