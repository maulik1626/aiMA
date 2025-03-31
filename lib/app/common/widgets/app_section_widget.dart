import 'package:aima/app/common/helpers/screen_size_getter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../theme/palette.dart';

class AppSection extends StatelessWidget {
  final Color? bgColor;
  final Color? titleColor;
  final Color? subtitleColor;
  final double? height;
  final double? width;
  final double? titleWidth;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String title;
  final String? subtitleText;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final Widget? trailing;
  final Axis direction;
  final String? heroTag;
  final Widget? child;
  final Widget? subtitleWidget;


  const AppSection({
    super.key,
    required this.title,
    this.bgColor,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.subtitleText,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.trailing,
    this.titleColor,
    this.subtitleColor,
    this.heroTag,
    this.direction = Axis.horizontal,
    this.child,
    this.titleWidth,
    this.subtitleWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: bgColor,
      width: width ?? context.width(),
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heroTag != null
                  ? Hero(
                      tag: heroTag!,
                      child: SizedBox(
                        width: titleWidth ??
                            ScreenSizeGetter().getScreenWidth(context),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: titleTextStyle ??
                                  boldTextStyle(
                                    size: 16,
                                    color: titleColor ?? Palette.kBlack,
                                  ),
                            ),
                            trailing ?? const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      width: titleWidth ??
                          ScreenSizeGetter().getScreenWidth(context),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: titleTextStyle ??
                                boldTextStyle(
                                  size: 16,
                                  color: titleColor ?? Palette.kBlack,
                                ),
                          ),
                          trailing ?? const SizedBox.shrink(),
                        ],
                      ),
                    ),
              if (subtitleText != null)
                SizedBox(
                  width: titleWidth ??
                      ScreenSizeGetter().getScreenWidth(context) * 0.75,
                  child: Text(
                    subtitleText!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: subtitleTextStyle ??
                        secondaryTextStyle(
                          size: 14,
                          color: subtitleColor ?? Palette.kBlack,
                        ),
                  ),
                ),
              if (subtitleWidget != null)
                subtitleWidget!,
            ],
          ),
          10.height,
          child ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
