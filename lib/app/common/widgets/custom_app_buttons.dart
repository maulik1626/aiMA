// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../constants/border_radius.dart';
import '../theme/palette.dart';

enum ButtonType { PRIMARY, SECONDARY, TERTIARY }

enum ButtonSize { PX56, PX48, PX44, PX32 }

class CustomAppButton extends StatefulWidget {
  final bool isLoading;
  final ButtonType buttonType;
  final ButtonSize buttonSize;
  final Function? onTap;
  final String? text;
  final double? width;
  final Color? color;
  final Color? enabledBorderColor;
  final Color? textColor;
  final Color? disabledColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? splashColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;
  final ShapeBorder? shapeBorder;
  final Widget? child;
  final double? elevation;
  final double? height;
  final bool enabled;
  final bool? enableScaleAnimation;
  final Color? disabledTextColor;
  final Color? loadingIndicatorColor;
  final double? loadingIndicatorSize;
  final HapticFeedback? hapticFeedback;
  final bool isNonTraditionalButton;
  final Widget? nonTraditionalButtonChild;

  const CustomAppButton({
    this.buttonType = ButtonType.PRIMARY,
    this.buttonSize = ButtonSize.PX56,
    this.isNonTraditionalButton = false,
    this.enabled = true,
    this.isLoading = false,
    this.hapticFeedback,
    this.onTap,
    this.text,
    this.width,
    this.color,
    this.textColor,
    this.padding,
    this.margin,
    this.textStyle,
    this.shapeBorder,
    this.child,
    this.elevation,
    this.height,
    this.disabledColor,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.enableScaleAnimation,
    this.disabledTextColor,
    this.loadingIndicatorColor,
    this.loadingIndicatorSize,
    this.enabledBorderColor,
    super.key,
    this.nonTraditionalButtonChild,
  }) : assert(
          isNonTraditionalButton == false || nonTraditionalButtonChild != null,
          'nonTraditionalButtonChild cannot be null when isNonTraditionalButton is true',
        );

  @override
  State<CustomAppButton> createState() => _CustomAppButtonState();
}

class _CustomAppButtonState extends State<CustomAppButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  AnimationController? _controller;

  @override
  void initState() {
    if (widget.enableScaleAnimation
        .validate(value: enableAppButtonScaleAnimationGlobal)) {
      _controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: appButtonScaleAnimationDurationGlobal ?? 50,
        ),
        lowerBound: 0.0,
        upperBound: 0.025,
      )..addListener(() {
          setState(() {});
        });
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null && widget.enabled) {
      _scale = 1 - _controller!.value;
    }

    if (widget.enableScaleAnimation
        .validate(value: enableAppButtonScaleAnimationGlobal)) {
      return Listener(
        onPointerDown: (details) {
          _controller?.forward();
        },
        onPointerUp: (details) {
          _controller?.reverse();
        },
        child: Transform.scale(
          scale: _scale,
          child: Padding(
            padding: widget.margin ?? EdgeInsets.zero,
            child: AbsorbPointer(
              absorbing: widget.isLoading,
              child: _buildButton(),
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: widget.margin ?? EdgeInsets.zero,
        child: AbsorbPointer(
          absorbing: widget.isLoading,
          child: _buildButton(),
        ),
      );
    }
  }

  Widget _buildButton() {
    if (widget.isNonTraditionalButton) {
      return GestureDetector(
        onTap: () {
          widget.hapticFeedback ?? HapticFeedback.lightImpact();
          widget.onTap!();
        },
        child: widget.nonTraditionalButtonChild!,
      );
    }

    switch (widget.buttonType) {
      case ButtonType.PRIMARY:
        return _buildMaterialButton(
          color: widget.color ?? widget.enabledBorderColor ?? Palette.kPrimary,
          borderSide: BorderSide.none,
        );
      case ButtonType.SECONDARY:
        return _buildMaterialButton(
          color: widget.color ?? Colors.white,
          borderSide: BorderSide(
            color: widget.enabled
                ? widget.enabledBorderColor ?? Palette.kPrimary
                : Colors.white,
            width: 1,
          ),
        );
      case ButtonType.TERTIARY:
        return _buildGestureButton();
    }
  }

  Widget _buildMaterialButton(
      {required Color color, required BorderSide borderSide}) {
    return MaterialButton(
      minWidth: widget.width,
      padding: widget.padding ?? _buildButtonPadding(),
      onPressed: widget.enabled
          ? widget.onTap != null
              ? () {
                  widget.hapticFeedback ?? HapticFeedback.lightImpact();
                  widget.onTap!();
                }
              : null
          : null,
      color: color,
      shape: RoundedRectangleBorder(
        side: borderSide,
        borderRadius: BorderRadius.circular(AppBorderRadius.s),
      ),
      elevation: 0,
      highlightElevation: 0,
      enableFeedback: true,
      animationDuration: const Duration(milliseconds: 300),
      height: widget.height,
      disabledColor: widget.disabledColor ?? Palette.kNeutral.shade300,
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      splashColor: widget.splashColor ?? _buildSplashColor(),
      disabledTextColor: widget.disabledTextColor,
      child: widget.isLoading
          ? _buildLoadingIndicator()
          : widget.child ?? _buildButtonText(),
    );
  }

  Color? _buildSplashColor() {
    switch (widget.buttonType) {
      case ButtonType.PRIMARY:
        return null;
      case ButtonType.SECONDARY:
        return Palette.kPrimary.withOpacity(0.2);
      case ButtonType.TERTIARY:
        return null;
    }
  }

  Widget _buildGestureButton() {
    return GestureDetector(
      onTap: widget.enabled
          ? widget.onTap != null
              ? () {
                  widget.hapticFeedback ?? HapticFeedback.lightImpact();
                  widget.onTap!();
                }
              : null
          : null,
      child: widget.isLoading
          ? _buildLoadingIndicator()
          : widget.child ?? _buildButtonText(),
    );
  }

  Widget _buildLoadingIndicator() {
    return SizedBox(
      width: widget.loadingIndicatorSize ?? 24,
      height: widget.loadingIndicatorSize ?? 24,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          widget.buttonType == ButtonType.PRIMARY
              ? widget.loadingIndicatorColor ?? Colors.white
              : widget.loadingIndicatorColor ?? Palette.kPrimary.shade700,
        ),
        strokeWidth: 2,
      ),
    );
  }

  Widget _buildButtonText() {
    return Text(
      widget.text.validate(),
      style: widget.textStyle ??
          boldTextStyle(
            color: _buildButtonFontColor(),
            weight: _buildButtonFontWeight(),
            size: _buildButtonFontSize(),
          ),
    );
  }

  EdgeInsetsGeometry _buildButtonPadding() {
    switch (widget.buttonSize) {
      case ButtonSize.PX56:
        return const EdgeInsets.symmetric(vertical: 16, horizontal: 24);
      case ButtonSize.PX48:
        return const EdgeInsets.symmetric(vertical: 12, horizontal: 32);
      case ButtonSize.PX44:
        return const EdgeInsets.symmetric(vertical: 9.5, horizontal: 20);
      case ButtonSize.PX32:
        return const EdgeInsets.symmetric(vertical: 5.5, horizontal: 16);
    }
  }

  Color _buildButtonFontColor() {
    switch (widget.buttonType) {
      case ButtonType.PRIMARY:
        return widget.enabled
            ? widget.textColor ?? Colors.white
            : Palette.kNeutral;
      case ButtonType.SECONDARY:
        return widget.enabled
            ? widget.textColor ?? Palette.kPrimary
            : Colors.white;
      case ButtonType.TERTIARY:
        log("widget.textColor: ${widget.textColor}");
        return widget.enabled
            ? widget.textColor ?? Palette.kPrimary
            : Palette.kNeutral.shade300;
    }
  }

  FontWeight _buildButtonFontWeight() {
    return FontWeight.w700;
  }

  int _buildButtonFontSize() {
    switch (widget.buttonSize) {
      case ButtonSize.PX56:
      case ButtonSize.PX48:
        return 16;
      case ButtonSize.PX44:
      case ButtonSize.PX32:
        return 14;
    }
  }
}
