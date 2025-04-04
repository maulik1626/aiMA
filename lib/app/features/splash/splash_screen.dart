import 'package:aima/app/common/constants/assets_path.dart';
import 'package:aima/app/common/constants/color_gradients.dart';
import 'package:aima/app/common/constants/hero_tags.dart';
import 'package:aima/app/common/utils/common_base.dart';
import 'package:aima/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  void init() {
    Future.delayed(const Duration(seconds: 2)).then(
          (value) {
        Navigator.pushNamed(context, Routes.WELCOME);
      },
    );
  }

  Widget _buildBody() {
    return Container(
      width: context.width(),
      height: context.height(),
      decoration: BoxDecoration(
        gradient: ColorGradients.welcomeScreenGradient,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: HeroTags.mobileLogo,
              child: PNGAssetsPath.phoneLogoImg.iconImage(
                size: context.width() * 0.9,
              ),
            ),
            Text(
              'aiMA',
              style: primaryTextStyle(
                weight: FontWeight.w600,
                size: 32,
                color: Colors.white,
              ),
            ).center(),
          ],
        ),
      ),
    );
  }
}
