import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomGradients {
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [
      Color(0xff313F31),
      Color(0xff1A251B),
    ],
  );

  static LinearGradient orangeGradient(Alignment begin, Alignment end) =>
      LinearGradient(
        begin: begin,
        end: end,
        colors: const [
          Color(0xffD09946),
          Color(0xffF3CC81),
        ],
      );

  static LinearGradient bestSellingProductsBottomAssetGradient(Alignment begin, Alignment end) =>
      LinearGradient(
        begin: begin,
        end: end,
        colors: const [
          Colors.transparent,
          Color(0xff589553),
          Color(0xff589553),
        ],
      );

  static LinearGradient priceBarGradient(Alignment begin, Alignment end) =>
      LinearGradient(
        begin: begin,
        end: end,
        stops: const [0.0, 1.0],
        colors: const [
          Color(0xff589553),
          Color(0xff41643E),
        ],
      );

  static LinearGradient darkGreenGradient(Alignment begin, Alignment end) =>
      LinearGradient(
        begin: begin,
        end: end,
        stops: const [0.2, 1.0],
        colors: const [
          Color(0xff1A251B),
          Color(0xff628B65),
        ],
      );

  static LinearGradient getBestPriceQuantityGradient(Alignment begin, Alignment end) =>
      LinearGradient(
        begin: begin,
        end: end,
        stops: const [0.0, 0.32, 0.89],
        colors: const [
          Color(0xff313F31),
          Color(0xff212D22),
          Color(0xff1A251B),
        ],
      );
}
