import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kPrimary = MaterialColor(
    0xff6D307C,
    <int, Color>{
      50: Color(0xfff6edf8),
      100: Color(0xffe3c8ea),
      200: Color(0xffd0a3db),
      300: Color(0xffbe7ecd),
      400: Color(0xffab5abf),
      500: Color(0xff9140a5),
      600: Color(0xff713281),
      700: Color(0xff51245c),
      800: Color(0xff301537),
      900: Color(0xff100712),
    },
  );

  static const MaterialColor kNeutral = MaterialColor(
    0xfffafafa,
    <int, Color>{
      100: Color(0xffe3e3e3),
      200: Color(0xffcccbcb),
      300: Color(0xffb5b3b3),
      400: Color(0xff9f9c9c),
      500: Color(0xff898384),
      600: Color(0xff726c6c),
      700: Color(0xff5a5555),
      800: Color(0xff433e3f),
      900: Color(0xff2b2828),
      1000: Color(0xff151314),
    },
  );

  static const MaterialColor kSuccess = MaterialColor(
    0xff29A871,
    <int, Color>{
      50: Color(0xffebfaf3),
      100: Color(0xffc2f0dc),
      200: Color(0xff99e6c4),
      300: Color(0xff70dcad),
      400: Color(0xff47d296),
      500: Color(0xff2db87c),
      600: Color(0xff238f61),
      700: Color(0xff196645),
      800: Color(0xff0f3d29),
      900: Color(0xff05140e),
    },
  );

  static const MaterialColor kWarning = MaterialColor(
    0xffEDA145,
    <int, Color>{
      50: Color(0xfffdf3e8),
      100: Color(0xfff8dcb9),
      200: Color(0xfff8dcb9),
      300: Color(0xffefad5c),
      400: Color(0xffeb952e),
      500: Color(0xffd17c14),
      600: Color(0xffa36010),
      700: Color(0xff74450b),
      800: Color(0xff462907),
      900: Color(0xff170e02),
    },
  );

  static const MaterialColor kError = MaterialColor(
    // kError : C03744
    0xffC03744,
    <int, Color>{
      50: Color(0xfff9ebed),
      100: Color(0xffeec4c8),
      200: Color(0xffe39ca3),
      300: Color(0xffd7747e),
      400: Color(0xffcc4d59),
      500: Color(0xffb2333f),
      600: Color(0xff8b2831),
      700: Color(0xff631c23),
      800: Color(0xff3b1115),
      900: Color(0xff140607),
    },
  );

  static const Color kGrey = Color(0xffeeeeee);

  static const Color kWhite = Color(0xffffffff);

  static const Color kBlack = Color(0xff0a0a0b);

  // static const Color kBookingStatusPending = Color(0xffFFA726);
  //
  // static const Color kBookingStatusCancelled = Color(0xffE53935);
  //
  // static const Color kBookingStatusCompleted = Color(0xff29B6F6);

  // PENDING color (#FFA726)
  static const MaterialColor kStatusPending = MaterialColor(
    0xFFFFA726,
    <int, Color>{
      50: Color(0xFFFFF3E0),
      100: Color(0xFFFFE0B2),
      200: Color(0xFFFFCC80),
      300: Color(0xFFFFB74D),
      400: Color(0xFFFFA726),
      500: Color(0xFFFFA726),
      600: Color(0xFFFB8C00),
      700: Color(0xFFF57C00),
      800: Color(0xFFEF6C00),
      900: Color(0xFFE65100),
    },
  );

  // CANCELLED color (#E53935)
  static const MaterialColor kStatusCancelled = MaterialColor(
    0xFFE53935,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFE53935),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );

  // RESCHEDULED color (#29B6F6)
  static const MaterialColor kStatusRescheduled = MaterialColor(
    0xFF29B6F6,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(0xFF29B6F6),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );

  /// #9D713F groomer Button color. Originally, Palette.kWarning.shade700.withOpacity(0.75)
  static const Color kGroomerButtonColor = Color(0xff9D713F);

  /// #ECF7FF Product Image Background color, Colors.blue.shade50.withOpacity(0.25)
static const Color kProductImageBG = Color(0xffECF7FF);

// 8DCBCD pet pharmacy color
  /// #8DCBCD Pet Pharmacy Background color, From pharmacy screen photo
static const Color kPetPharmacyBG = Color(0xff8DCBCD);

}
