import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginProvider extends ChangeNotifier {
  // TextEditingControllers
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // FocusNodes
  FocusNode nameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  // Variables
  bool isRememberMe = false;


  notifyState() {
    notifyListeners();
  }
}
