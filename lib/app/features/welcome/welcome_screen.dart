import 'package:aima/app/common/constants/assets_path.dart';
import 'package:aima/app/common/constants/border_radius.dart';
import 'package:aima/app/common/constants/color_gradients.dart';
import 'package:aima/app/common/constants/hero_tags.dart';
import 'package:aima/app/common/utils/common_base.dart';
import 'package:aima/app/common/widgets/custom_app_buttons.dart';
import 'package:aima/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: context.width(),
      height: context.height(),
      decoration: BoxDecoration(
        gradient: ColorGradients.welcomeScreenGradient,
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildWelcomeSection(),
            _buildButtonsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Column(
      children: [
        50.height,
        Hero(
          tag: HeroTags.mobileLogo,
          child: PNGAssetsPath.welcomeImg1.iconImage(
            size: context.width(),
          ),
        ),
        Text(
          'Welcome to aiMA',
          style: primaryTextStyle(
            weight: FontWeight.w600,
            size: 32,
            color: Colors.white,
          ),
        ).center(),
        Text(
          'An AI powered app to launch your ad campaigns from your mobile',
          textAlign: TextAlign.center,
          style: primaryTextStyle(
            size: 15,
            color: Colors.white,
          ),
        ).center().paddingSymmetric(horizontal: 8),
      ],
    );
  }

  Widget _buildButtonsSection() {
    return AnimatedScrollView(
      children: [
        CustomAppButton(
          onTap: () {
            log('test');
            Navigator.pushNamed(context, Routes.LOGIN);
          },
          isNonTraditionalButton: true,
          nonTraditionalButtonChild: Container(
            height: 50,
            width: context.width(),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              gradient: ColorGradients.welcomeScreenGradientReversed,
              borderRadius: radius(AppBorderRadius.s5),
            ),
            child: Center(
              child: Text(
                'Login',
                style: primaryTextStyle(
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        16.height,
        CustomAppButton(
          onTap: () {},
          isNonTraditionalButton: true,
          nonTraditionalButtonChild: Container(
            height: 50,
            width: context.width(),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: radius(AppBorderRadius.s5),
            ),
            child: Center(
              child: Text(
                'Sign up',
                style: primaryTextStyle(
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        40.height,
      ],
    );
  }
}
