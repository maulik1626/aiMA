import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../features/splash/splash_provider.dart';

class Providers {
  static List<SingleChildWidget> getAllProviders() {
    List<SingleChildWidget> providers = [
      ChangeNotifierProvider(create: (BuildContext context) => SplashProvider()),
      // ChangeNotifierProvider(create: (BuildContext context) => LoginProvider()),
    ];
    return providers;
  }
}
