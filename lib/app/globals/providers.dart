import 'package:aima/app/features/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../features/welcome/welcome_provider.dart';

class Providers {
  static List<SingleChildWidget> getAllProviders() {
    List<SingleChildWidget> providers = [
      ChangeNotifierProvider(create: (BuildContext context) => WelcomeProvider()),
      ChangeNotifierProvider(create: (BuildContext context) => LoginProvider()),
    ];
    return providers;
  }
}
