import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../theme/palette.dart';

class OtpResendTimer extends StatefulWidget {
  final Function() onResend;
  final int timerDurationInSeconds;

  const OtpResendTimer({
    required this.onResend,
    required this.timerDurationInSeconds,
    super.key,
  });

  @override
  _OtpResendTimerState createState() => _OtpResendTimerState();
}

class _OtpResendTimerState extends State<OtpResendTimer> {
  int secondsRemaining = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    secondsRemaining = widget.timerDurationInSeconds;

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        t.cancel(); // Stop the timer when the countdown ends
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (secondsRemaining > 0)
          RichTextWidget(
            list: [
              TextSpan(
                text: 'Resend in ',
                style: primaryTextStyle(
                  weight: FontWeight.w500,
                  color: Palette.kNeutral.shade100,
                  size: 14,
                ),
              ),
              TextSpan(
                text: '$secondsRemaining seconds',
                // text: '30 seconds',
                style: primaryTextStyle(
                  weight: FontWeight.w700,
                  color: Palette.kPrimary.shade100,
                  size: 14,
                ),
              ),
            ],
          )
        else
          Text(
            'RESEND OTP',
            style: primaryTextStyle(
              decoration: TextDecoration.underline,
              decorationColor: Palette.kNeutral.shade100,
              weight: FontWeight.w500,
              color: Palette.kNeutral.shade100,
              size: 14,
            ),
          ).onTap(() {
            widget.onResend();
            startTimer(); // Restart the timer after resend
          }),
      ],
    );
  }
}