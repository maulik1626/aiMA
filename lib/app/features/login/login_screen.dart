import 'package:aima/app/common/constants/assets_path.dart';
import 'package:aima/app/common/constants/border_radius.dart';
import 'package:aima/app/common/constants/color_gradients.dart';
import 'package:aima/app/common/constants/hero_tags.dart';
import 'package:aima/app/common/theme/palette.dart';
import 'package:aima/app/common/utils/common_base.dart';
import 'package:aima/app/common/widgets/custom_app_buttons.dart';
import 'package:aima/app/features/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Consumer<LoginProvider>(
          builder: (BuildContext context, LoginProvider prov, Widget? _) {
        return Scaffold(
          body: _buildBody(prov),
          bottomSheet: _buildBottomSheet(prov),
        );
      }),
    );
  }

  Widget _buildBody(LoginProvider prov) {
    return Container(
      width: context.width(),
      height: context.height(),
      decoration: BoxDecoration(
        gradient: ColorGradients.welcomeScreenGradient,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: HeroTags.mobileLogo,
              child: PNGAssetsPath.phoneLogoImg
                  .iconImage(
                    size: 200,
                  )
                  .center(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheet(LoginProvider prov) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: context.height() * 0.725,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppBorderRadius.ml),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              dragHandle(),
              16.height,
              _buildNameTextField(prov),
              16.height,
              _buildPasswordTextField(prov),
              16.height,
              _buildForgotPasswordRow(prov),
              16.height,
              _buildLoginButton(prov),
              16.height,
              _buildORDivider(),
              16.height,
              _buildSocialLoginSection(prov),
            ],
          ),
          _buildSignupSection(prov),
        ],
      ),
    );
  }

  Widget _buildNameTextField(LoginProvider prov) {
    return AppTextField(
      controller: prov.nameController,
      // Optional
      textFieldType: TextFieldType.NAME,
      autoFocus: false,

      maxLines: 1,
      maxLength: 30,

      focus: prov.nameFocusNode,

      onChanged: (value) {
        setState(() {});
      },
      onFieldSubmitted: (_) {
        // focus next field
        prov.passwordFocusNode.requestFocus();
        // prov.updateUserProfile();
      },
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
      ],
      isValidationRequired: true,
      keyboardAppearance: Brightness.dark,
      cursorColor: Palette.kPrimary.shade200,
      textStyle: primaryTextStyle(
        weight: FontWeight.w500,
        color: Palette.kBlack,
        size: 14,
      ),
      decoration: InputDecoration(
        labelText: 'Username',
        floatingLabelStyle: primaryTextStyle(
          weight: FontWeight.w500,
          color: Palette.kPrimary,
          size: 14,
        ),
        counter: Visibility(
          visible: false,
          child: Text(
            "${prov.nameController.text.length}",
            style: primaryTextStyle(
              weight: FontWeight.w500,
              color: Palette.kNeutral,
              size: 14,
            ),
          ),
        ),
        labelStyle: primaryTextStyle(
          weight: FontWeight.w500,
          color: Palette.kNeutral.shade300,
          size: 14,
        ),
        // suffixIcon: prov.nameController.text.trim().isNotEmpty
        //     ? Padding(
        //         padding: const EdgeInsetsDirectional.only(
        //             end: 20.0, top: 12, bottom: 12, start: 12),
        //         child: SVGAssetsPath.icCloseSquareOutlined
        //             .iconImage(size: 24, color: Colors.pink)
        //             .onTap(
        //           () {
        //             HapticFeedback.lightImpact();
        //             prov.nameController.clear();
        //             setState(() {});
        //           },
        //         ),
        //       )
        //     : null,
        errorStyle: primaryTextStyle(
          weight: FontWeight.w500,
          color: Palette.kError,
          size: 12,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.m),
          borderSide: const BorderSide(
            color: Palette.kError,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.m),
          borderSide: const BorderSide(
            color: Palette.kError,
            width: 1.5,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.m),
          borderSide: BorderSide(
            color: Palette.kNeutral.shade400,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.m),
          borderSide: BorderSide(
            color: Palette.kNeutral.shade400,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.m),
          borderSide: BorderSide(
            color: Palette.kPrimary.shade400,
            width: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField(LoginProvider prov) {
    return AppTextField(
      obscureText: true,
      controller: prov.passwordController,
      // Optional
      textFieldType: TextFieldType.PASSWORD,
      autoFocus: false,

      maxLines: 1,
      maxLength: 30,

      focus: prov.passwordFocusNode,

      onChanged: (value) {
        setState(() {});
      },
      onFieldSubmitted: (_) {},
      inputFormatters: [],
      isValidationRequired: true,
      keyboardAppearance: Brightness.dark,
      cursorColor: Palette.kPrimary.shade200,
      textStyle: primaryTextStyle(
        weight: FontWeight.w500,
        color: Palette.kBlack,
        size: 14,
      ),
      decoration: InputDecoration(
        labelText: 'Password',
        floatingLabelStyle: primaryTextStyle(
          weight: FontWeight.w500,
          color: Palette.kPrimary,
          size: 14,
        ),
        counter: Visibility(
          visible: false,
          child: Text(
            "${prov.nameController.text.length}",
            style: primaryTextStyle(
              weight: FontWeight.w500,
              color: Palette.kNeutral,
              size: 14,
            ),
          ),
        ),
        labelStyle: primaryTextStyle(
          weight: FontWeight.w500,
          color: Palette.kNeutral.shade300,
          size: 14,
        ),
        // suffixIcon: prov.nameController.text.trim().isNotEmpty
        //     ? Padding(
        //         padding: const EdgeInsetsDirectional.only(
        //             end: 20.0, top: 12, bottom: 12, start: 12),
        //         child: SVGAssetsPath.icCloseSquareOutlined
        //             .iconImage(size: 24, color: Colors.pink)
        //             .onTap(
        //           () {
        //             HapticFeedback.lightImpact();
        //             prov.nameController.clear();
        //             setState(() {});
        //           },
        //         ),
        //       )
        //     : null,
        errorStyle: primaryTextStyle(
          weight: FontWeight.w500,
          color: Palette.kError,
          size: 12,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.m),
          borderSide: const BorderSide(
            color: Palette.kError,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.m),
          borderSide: const BorderSide(
            color: Palette.kError,
            width: 1.5,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.m),
          borderSide: BorderSide(
            color: Palette.kNeutral.shade400,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.m),
          borderSide: BorderSide(
            color: Palette.kNeutral.shade400,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.m),
          borderSide: BorderSide(
            color: Palette.kPrimary.shade400,
            width: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordRow(LoginProvider prov) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAppButton(
          onTap: () {
            prov.isRememberMe = !prov.isRememberMe;
            prov.notifyState();
          },
          isNonTraditionalButton: true,
          nonTraditionalButtonChild: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Palette.kPrimary,
                      width: 1,
                    ),
                    borderRadius: radius(2)),
                child: prov.isRememberMe
                    ? const Center(
                        child: Icon(
                          Icons.check,
                          color: Palette.kPrimary,
                          size: 12,
                          weight: 100,
                        ),
                      )
                    : null,
              ),
              8.width,
              Text(
                'Remember me',
                style: primaryTextStyle(color: Palette.kPrimary),
              ),
            ],
          ),
        ),
        CustomAppButton(
          onTap: () {},
          isNonTraditionalButton: true,
          nonTraditionalButtonChild: Text(
            'Forgot Password?',
            style: primaryTextStyle(
                color: Palette.kPrimary,
                decoration: TextDecoration.underline,
                decorationColor: Palette.kPrimary),
          ),
        )
      ],
    );
  }

  Widget _buildLoginButton(LoginProvider prov) {
    return CustomAppButton(
      onTap: () {},
      isNonTraditionalButton: true,
      nonTraditionalButtonChild: Container(
        height: 50,
        width: context.width(),
        decoration: BoxDecoration(
          gradient: ColorGradients.welcomeScreenGradientReversed,
          borderRadius: radius(5),
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
    );
  }

  Widget _buildORDivider() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
        8.width,
        Text(
          'OR',
          style: primaryTextStyle(
            color: Colors.grey,
            size: 15,
          ),
        ),
        8.width,
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLoginSection(LoginProvider prov) {
    return Row(
      children: [
        const Spacer(),
        CustomAppButton(
          onTap: () {},
          isNonTraditionalButton: true,
          nonTraditionalButtonChild: PNGAssetsPath.google.iconImage(size: 45),
        ),
        30.width,
        CustomAppButton(
          onTap: () {},
          isNonTraditionalButton: true,
          nonTraditionalButtonChild: PNGAssetsPath.facebook.iconImage(size: 45),
        ),
        30.width,
        CustomAppButton(
          onTap: () {},
          isNonTraditionalButton: true,
          nonTraditionalButtonChild: PNGAssetsPath.tiktok.iconImage(size: 45),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildSignupSection(LoginProvider prov) {
    return RichTextWidget(
      // Didn’t have an account? Sign up
      list: [
        TextSpan(
          text: 'Didn’t have an account? ',
          style: primaryTextStyle(
            color: Colors.grey,
            size: 15,
          ),
        ),
        TextSpan(
          text: 'Sign up',
          style: primaryTextStyle(
            color: Palette.kPrimary,
            size: 15,
          ),
        ),
      ],
    ).paddingBottom(20);
  }
}
