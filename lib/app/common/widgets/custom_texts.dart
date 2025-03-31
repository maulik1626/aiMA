import 'package:flutter/material.dart';


class ExtraLargeText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? color;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextDecoration? decoration;

  /// [fontSize] = 32.0
  const ExtraLargeText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight,
    this.fontStyle,
    this.color = const Color(0xff48594C),
    this.letterSpacing,
    this.wordSpacing,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
       text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        decoration: decoration,
      ),
    );
  }
}

class LargeText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? color;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextDecoration? decoration;

  /// [fontSize] = 24.0
  const LargeText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight,
    this.fontStyle,
    this.color = const Color(0xff48594C),
    this.letterSpacing,
    this.wordSpacing,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
       text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        decoration: decoration,
      ),
    );
  }
}

class MediumText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? color;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextDecoration? decoration;

  /// [fontSize] = 22.0
  const MediumText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight,
    this.fontStyle,
    this.color = const Color(0xff48594C),
    this.letterSpacing,
    this.wordSpacing,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
       text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: 22.0,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        decoration: decoration,
      ),
    );
  }
}

class RegularText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? color;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextDecoration? decoration;

  /// [fontSize] = 18.0
  const RegularText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight,
    this.fontStyle,
    this.color = const Color(0xff48594C),
    this.letterSpacing,
    this.wordSpacing,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
       text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        decoration: decoration,
      ),
    );
  }
}

class StandardText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? color;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextDecoration? decoration;

  /// [fontSize] = 20.0
  const StandardText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight,
    this.fontStyle,
    this.color = const Color(0xff48594C),
    this.letterSpacing,
    this.wordSpacing,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
       text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        decoration: decoration,
      ),
    );
  }
}

class BigText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? color;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextDecoration? decoration;

  /// [fontSize] = 16.0
  const BigText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight,
    this.fontStyle,
    this.color = const Color(0xff48594C),
    this.letterSpacing,
    this.wordSpacing,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
       text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        decoration: decoration,
      ),
    );
  }
}

class NormalText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? color;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextDecoration? decoration;

  /// [fontSize] = 14.0
  const NormalText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight,
    this.fontStyle,
    this.color = const Color(0xff48594C),
    this.letterSpacing,
    this.wordSpacing,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
       text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        decoration: decoration,
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? color;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextDecoration? decoration;

  /// [fontSize] = 12.0
  const SmallText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight,
    this.fontStyle,
    this.color = const Color(0xff48594C),
    this.letterSpacing,
    this.wordSpacing,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
       text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        decoration: decoration,
      ),
    );
  }
}

class ExtraSmallText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? color;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextDecoration? decoration;

  /// [fontSize] = 10.0
  const ExtraSmallText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight,
    this.fontStyle,
    this.color,
    this.letterSpacing,
    this.wordSpacing,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
       text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: 10.0,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        decoration: decoration,
      ),
    );
  }
}
