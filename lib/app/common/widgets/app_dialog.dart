import 'package:aima/app/common/constants/border_radius.dart';
import 'package:aima/app/common/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'custom_app_buttons.dart';

class AppDialog extends StatelessWidget {
  final Function() onNoPressed;
  final Function() onYesPressed;
  final String title;

  const AppDialog(
      {super.key,
        required this.onNoPressed,
        required this.onYesPressed,
        required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 150,
          width: context.width() * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: radius(AppBorderRadius.m12),
          ),
          child: Column(
            children: [
              Text(
                title,
                style: boldTextStyle(size: 16),
                textAlign: TextAlign.center,
              ).paddingAll(25),
              Container(
                height: 0.75,
                color: Palette.kNeutral.shade100,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CustomAppButton(
                        onTap: onNoPressed,
                        isNonTraditionalButton: true,
                        nonTraditionalButtonChild: Container(
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              "No",
                              style: boldTextStyle(
                                  size: 16,
                                  weight: FontWeight.w600,
                                  color: Palette.kStatusRescheduled.shade700),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 0.75,
                      color: Palette.kNeutral.shade100,
                    ),
                    Expanded(
                      child: CustomAppButton(
                        onTap: onYesPressed,
                        isNonTraditionalButton: true,
                        nonTraditionalButtonChild: Container(
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              "Yes",
                              style: boldTextStyle(
                                  size: 16,
                                  weight: FontWeight.w500,
                                  color: Palette.kError),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
