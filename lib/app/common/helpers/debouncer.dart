import 'dart:async';

import 'package:flutter/cupertino.dart';

class DeBouncer {
  final int milliseconds;
  late VoidCallback action;
  late Timer _timer;

  DeBouncer({required this.milliseconds}) {
    _timer = Timer(Duration(milliseconds: milliseconds), () {});
  }

  void run(VoidCallback action) {
    this.action = action;
    _timer.cancel(); // Cancel previous timer if it's active
    _timer = Timer(Duration(milliseconds: milliseconds), () {
      action(); // Execute the action after the specified duration
    });
  }
}
