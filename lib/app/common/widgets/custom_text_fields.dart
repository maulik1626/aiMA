// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:recase/recase.dart';
import '../constants/border_radius.dart';
import '../theme/palette.dart';

/// Default Text Form Field
///
/// ChatGPT Parameters:
/// - `enableChatGPT`: A flag to enable or disable the ChatGPT feature.
/// - `promptFieldInputDecoration`: Custom input decoration for the prompt field in the chatGpt widget.
/// - `suffixChatGPTIcon`: An optional widget to be displayed as a suffix icon in the ChatGPT input field.
/// - `loadingChatGPT`: An optional widget to be displayed as a loading indicator during ChatGPT response generation.
/// - `shortReply`: If true, it will generate a 1-2 line reply. Default is false.
/// - `testWithoutKey`: If true, it will provide a static test response without using the actual API key. Default is false.
///
class CustomAppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextFieldType textFieldType;

  final InputDecoration? decoration;
  final FocusNode? focus;
  final FormFieldValidator<String>? validator;
  final bool isValidationRequired;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final FocusNode? nextFocus;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final bool autoFocus;
  final bool readOnly;
  final bool? enableSuggestions;
  final int? maxLength;
  final Color? cursorColor;
  final Widget? suffix;
  final Color? suffixIconColor;
  final TextInputType? keyboardType;
  final Iterable<String>? autoFillHints;
  final EdgeInsets? scrollPadding;
  final double? cursorWidth;
  final double? cursorHeight;
  final Function()? onTap;
  final InputCounterWidgetBuilder? buildCounter;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlignVertical? textAlignVertical;
  final bool expands;
  final bool? showCursor;
  final TextSelectionControls? selectionControls;
  final StrutStyle? strutStyle;
  final String obscuringCharacter;
  final String? initialValue;
  final Brightness? keyboardAppearance;
  final Widget? suffixPasswordVisibleWidget;
  final Widget? suffixPasswordInvisibleWidget;
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  final String? errorThisFieldRequired;
  final String? errorInvalidEmail;
  final String? errorMinimumPasswordLength;
  final String? errorInvalidURL;
  final String? errorInvalidUsername;

  final String? title;
  final TextStyle? titleTextStyle;
  final int spacingBetweenTitleAndTextFormField;

  //ChatGPT Params
  final bool enableChatGPT;
  final Widget? suffixChatGPTIcon;
  final Widget? loaderWidgetForChatGPT;
  final InputDecoration? promptFieldInputDecorationChatGPT;
  final bool shortReplyChatGPT;
  final bool testWithoutKeyChatGPT;

  @Deprecated('Use TextFieldType.PASSWORD instead')
  final bool? isPassword;

  const CustomAppTextField({
    this.controller,
    required this.textFieldType,
    this.decoration,
    this.focus,
    this.validator,
    this.isPassword,
    this.buildCounter,
    this.isValidationRequired = true,
    this.textCapitalization,
    this.textInputAction,
    this.onFieldSubmitted,
    this.nextFocus,
    this.textStyle,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.minLines,
    this.enabled,
    this.onChanged,
    this.cursorColor,
    this.suffix,
    this.suffixIconColor,
    this.enableSuggestions,
    this.autoFocus = false,
    this.readOnly = false,
    this.maxLength,
    this.keyboardType,
    this.autoFillHints,
    this.scrollPadding,
    this.onTap,
    this.cursorWidth,
    this.cursorHeight,
    this.inputFormatters,
    this.errorThisFieldRequired,
    this.errorInvalidEmail,
    this.errorMinimumPasswordLength,
    this.errorInvalidURL,
    this.errorInvalidUsername,
    this.textAlignVertical,
    this.expands = false,
    this.showCursor,
    this.selectionControls,
    this.strutStyle,
    this.obscuringCharacter = '•',
    this.initialValue,
    this.keyboardAppearance,
    this.suffixPasswordVisibleWidget,
    this.suffixPasswordInvisibleWidget,
    this.contextMenuBuilder,
    this.title,
    this.titleTextStyle,
    this.spacingBetweenTitleAndTextFormField = 4,

    //ChatGpt Params
    this.enableChatGPT = false,
    this.loaderWidgetForChatGPT,
    this.suffixChatGPTIcon,
    this.promptFieldInputDecorationChatGPT,
    this.shortReplyChatGPT = false,
    this.testWithoutKeyChatGPT = false,
    super.key,
  });

  @override
  State<CustomAppTextField> createState() => _CustomAppTextFieldState();
// @override
// _CustomAppTextFieldState createState() => _CustomAppTextFieldState();
}

class _CustomAppTextFieldState extends State<CustomAppTextField> {
  bool isPasswordVisible = false;
  List<String> recentChat = [];

  FormFieldValidator<String>? applyValidation() {
    if (widget.isValidationRequired) {
      if (widget.validator != null) {
        return widget.validator;
      } else if (widget.textFieldType == TextFieldType.EMAIL) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                .validate(value: errorThisFieldRequired);
          }
          if (!s.trim().validateEmail()) {
            return widget.errorInvalidEmail.validate(value: 'Email is invalid');
          }
          return null;
        };
      } else if (widget.textFieldType == TextFieldType.EMAIL_ENHANCED) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                .validate(value: errorThisFieldRequired);
          }
          if (!s.trim().validateEmailEnhanced()) {
            return widget.errorInvalidEmail.validate(value: 'Email is invalid');
          }
          return null;
        };
      } else if (widget.textFieldType == TextFieldType.PASSWORD) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                .validate(value: errorThisFieldRequired);
          }
          if (s.trim().length < passwordLengthGlobal) {
            return widget.errorMinimumPasswordLength.validate(
                value:
                    'Minimum password length should be $passwordLengthGlobal');
          }
          return null;
        };
      } else if (widget.textFieldType == TextFieldType.NAME ||
          widget.textFieldType == TextFieldType.PHONE ||
          widget.textFieldType == TextFieldType.NUMBER) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                .validate(value: errorThisFieldRequired);
          }
          return null;
        };
      } else if (widget.textFieldType == TextFieldType.URL) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                .validate(value: errorThisFieldRequired);
          }
          if (!s.validateURL()) {
            return widget.errorInvalidURL.validate(value: 'Invalid URL');
          }
          return null;
        };
      } else if (widget.textFieldType == TextFieldType.USERNAME) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                .validate(value: errorThisFieldRequired);
          }
          if (s.contains(' ')) {
            return widget.errorInvalidUsername
                .validate(value: 'Username should not contain space');
          }
          return null;
        };
      } else if (widget.textFieldType == TextFieldType.MULTILINE) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                .validate(value: errorThisFieldRequired);
          }
          return null;
        };
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  TextCapitalization applyTextCapitalization() {
    if (widget.textCapitalization != null) {
      return widget.textCapitalization!;
    } else if (widget.textFieldType == TextFieldType.NAME) {
      return TextCapitalization.words;
    } else if (widget.textFieldType == TextFieldType.MULTILINE) {
      return TextCapitalization.sentences;
    } else {
      return TextCapitalization.none;
    }
  }

  TextInputAction? applyTextInputAction() {
    if (widget.textInputAction != null) {
      return widget.textInputAction;
    } else if (widget.textFieldType == TextFieldType.MULTILINE) {
      return TextInputAction.newline;
    } else if (widget.nextFocus != null) {
      return TextInputAction.next;
    } else {
      return TextInputAction.done;
    }
  }

  TextInputType? applyTextInputType() {
    if (widget.keyboardType != null) {
      return widget.keyboardType;
    } else if (widget.textFieldType == TextFieldType.EMAIL ||
        widget.textFieldType == TextFieldType.EMAIL_ENHANCED) {
      return TextInputType.emailAddress;
    } else if (widget.textFieldType == TextFieldType.MULTILINE) {
      return TextInputType.multiline;
    } else if (widget.textFieldType == TextFieldType.PASSWORD) {
      return TextInputType.visiblePassword;
    } else if (widget.textFieldType == TextFieldType.PHONE ||
        widget.textFieldType == TextFieldType.NUMBER) {
      return TextInputType.number;
    } else if (widget.textFieldType == TextFieldType.URL) {
      return TextInputType.url;
    } else {
      return TextInputType.text;
    }
  }

  void onPasswordVisibilityChange(bool val) {
    isPasswordVisible = val;
    setState(() {});
  }

  Widget chatGPTWidget() {
    return ChatGPTWidget(
      promptFieldInputDecoration: widget.promptFieldInputDecorationChatGPT,
      shortReply: widget.shortReplyChatGPT,
      testWithoutKey: widget.testWithoutKeyChatGPT,
      initialPrompt: widget.controller != null ? widget.controller!.text : '',
      recentList: recentChat,
      loaderWidget: widget.loaderWidgetForChatGPT,
      chatGPTModuleStrings: ChatGPTModuleStrings(),
      onResponse: (s) {
        if (s.isNotEmpty) {
          widget.controller?.text = s;
          setState(() {});
        }
      },
      child: widget.suffixChatGPTIcon ??
          Transform.flip(
            flipX: true,
            child: Image.asset(
              "assets/icons/ic_beautify.png",
              height: 22,
              package: channelName,
              width: 22,
              color: context.iconColor,
              fit: BoxFit.cover,
              // color: context.primaryColor,
              errorBuilder: (context, error, stackTrace) => Text(
                "AI",
                style: boldTextStyle(color: context.primaryColor, size: 16),
              ),
            ),
          ),
    );
  }

  Widget? suffixIcon() {
    if (widget.textFieldType == TextFieldType.PASSWORD) {
      if (widget.suffix != null) {
        return widget.suffix;
      } else {
        if (isPasswordVisible) {
          if (widget.suffixPasswordVisibleWidget != null) {
            return widget.suffixPasswordVisibleWidget!.onTap(() {
              onPasswordVisibilityChange(false);
            });
          } else {
            return Icon(
              Icons.visibility,
              color:
                  widget.suffixIconColor ?? Theme.of(context).iconTheme.color,
            ).onTap(() {
              onPasswordVisibilityChange(false);
            });
          }
        } else {
          if (widget.suffixPasswordInvisibleWidget != null) {
            return widget.suffixPasswordInvisibleWidget!.onTap(() {
              onPasswordVisibilityChange(true);
            });
          } else {
            return Icon(
              Icons.visibility_off,
              color:
                  widget.suffixIconColor ?? Theme.of(context).iconTheme.color,
            ).onTap(() {
              onPasswordVisibilityChange(true);
            });
          }
        }
      }
    } else {
      return widget.suffix;
    }
  }

  Iterable<String>? applyAutofillHints() {
    if (widget.textFieldType == TextFieldType.EMAIL ||
        widget.textFieldType == TextFieldType.EMAIL_ENHANCED) {
      return [AutofillHints.email];
    } else if (widget.textFieldType == TextFieldType.PASSWORD) {
      return [AutofillHints.password];
    }
    return null;
  }

  Widget textFormFieldWidget() {
    return TextFormField(
      controller: widget.controller,
      obscureText:
          widget.textFieldType == TextFieldType.PASSWORD && !isPasswordVisible,
      validator: applyValidation(),
      textCapitalization: applyTextCapitalization(),
      textInputAction: applyTextInputAction(),
      onFieldSubmitted: (s) {
        if (widget.nextFocus != null) {
          FocusScope.of(context).requestFocus(widget.nextFocus);
        }

        if (widget.onFieldSubmitted != null) widget.onFieldSubmitted!.call(s);
      },
      keyboardType: applyTextInputType(),
      decoration: widget.decoration != null
          ? (widget.decoration!.copyWith(
              suffixIcon: widget.enableChatGPT &&
                      widget.textFieldType != TextFieldType.PASSWORD
                  ? chatGPTWidget()
                  : suffixIcon(),
            ))
          : const InputDecoration(),
      focusNode: widget.focus,
      style: widget.textStyle ?? primaryTextStyle(),
      textAlign: widget.textAlign,
      maxLines: widget.maxLines.validate(
        value: widget.textFieldType == TextFieldType.MULTILINE ? 10 : 1,
      ),
      minLines: widget.minLines.validate(
        value: widget.textFieldType == TextFieldType.MULTILINE ? 2 : 1,
      ),
      autofocus: widget.autoFocus,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      cursorColor: widget.cursorColor ??
          Theme.of(context).textSelectionTheme.cursorColor,
      readOnly: widget.readOnly,
      maxLength: widget.maxLength,
      enableSuggestions: widget.enableSuggestions.validate(value: true),
      autofillHints: widget.autoFillHints ?? applyAutofillHints(),
      scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20),
      cursorWidth: widget.cursorWidth.validate(value: 2.0),
      cursorHeight: widget.cursorHeight,
      cursorRadius: radiusCircular(4),
      onTap: widget.onTap,
      buildCounter: widget.buildCounter,
      scrollPhysics: const BouncingScrollPhysics(),
      enableInteractiveSelection: true,
      inputFormatters: widget.inputFormatters,
      textAlignVertical: widget.textAlignVertical,
      expands: widget.expands,
      showCursor: widget.showCursor,
      selectionControls:
          widget.selectionControls ?? MaterialTextSelectionControls(),
      strutStyle: widget.strutStyle,
      obscuringCharacter: widget.obscuringCharacter,
      initialValue: widget.initialValue,
      keyboardAppearance: widget.keyboardAppearance,
      contextMenuBuilder: widget.contextMenuBuilder,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.title.validate().isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title!,
            style: widget.titleTextStyle ?? primaryTextStyle(),
          ),
          widget.spacingBetweenTitleAndTextFormField.height,
          textFormFieldWidget(),
        ],
      );
    }

    return textFormFieldWidget();
  }
}

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool? obscureText;
  final bool enabled;
  final bool readOnly;
  final int maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final bool autofocus;
  final EdgeInsets? scrollPadding;

  final Function()? onTap;

  final Color? fillColor;

  final TextStyle? hintStyle;
  final bool hasBorder;
  final Color? cursorColor;
  final TextStyle? textStyle;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.validator,
    this.controller,
    this.keyboardType,
    this.maxLines,
    this.obscureText,
    this.enabled = true,
    this.readOnly = false,
    this.maxLength = 50,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.autofocus = false,
    this.hasBorder = true,
    this.scrollPadding,
    this.fillColor,
    this.hintStyle,
    this.cursorColor,
    this.textStyle,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {}); // Rebuild the widget to update the elevation
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // elevation: _focusNode.hasFocus ? 5.0 : 0.0,
      // Change elevation based on focus
      borderRadius: BorderRadius.circular(AppBorderRadius.m),
      shadowColor: Colors.grey.shade200,
      child: TextFormField(
        focusNode: _focusNode,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        obscureText: widget.obscureText ?? false,
        cursorColor: widget.cursorColor ?? Palette.kPrimary,
        autofocus: widget.autofocus,
        readOnly: widget.readOnly,
        maxLength: widget.maxLength,
        inputFormatters: widget.inputFormatters,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20),
        buildCounter: (BuildContext context,
                {int? currentLength, bool? isFocused, int? maxLength}) =>
            null,
        style: widget.textStyle,
        decoration: InputDecoration(
          hintText: widget.hintText,
          fillColor: widget.fillColor,
          filled: widget.fillColor != null ? true : false,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          hintStyle: widget.hintStyle ??
              const TextStyle(color: Colors.grey, fontSize: 14),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          enabled: widget.enabled,
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: widget.hasBorder
                ? BorderSide(color: Colors.grey.shade300, width: 2)
                : const BorderSide(color: Colors.transparent, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: widget.hasBorder
                ? BorderSide(color: Palette.kPrimary.shade400, width: 2)
                : const BorderSide(color: Colors.transparent, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: widget.hasBorder
                ? BorderSide(color: Colors.grey.shade300, width: 2)
                : const BorderSide(color: Colors.transparent, width: 0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: widget.hasBorder
                ? const BorderSide(color: Colors.red, width: 2)
                : const BorderSide(color: Colors.transparent, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}

class CustomUnderlineTextFormField extends StatefulWidget {
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool? obscureText;
  final Function()? onSuffixIconPressed;
  final bool enabled;
  final bool readOnly;
  final int maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String value)? onChanged;

  final Function()? onTap;

  final double fontSize;
  final double hintTextFontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final Color hintTextColor;
  final Color cursorColor;
  final FontWeight hintTextFontWeight;
  final EdgeInsets? scrollPadding;

  final EdgeInsets? contentPadding;

  const CustomUnderlineTextFormField({
    super.key,
    required this.hintText,
    this.validator,
    this.controller,
    this.keyboardType,
    this.maxLines,
    this.obscureText,
    this.enabled = true,
    this.readOnly = false,
    this.maxLength = 50,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.onSuffixIconPressed,
    this.fontSize = 16,
    this.hintTextFontSize = 16,
    this.textColor = Colors.black,
    this.hintTextColor = Colors.grey,
    this.fontWeight = FontWeight.bold,
    this.hintTextFontWeight = FontWeight.w400,
    this.cursorColor = Palette.kPrimary,
    this.scrollPadding,
    this.contentPadding,
  });

  @override
  State<CustomUnderlineTextFormField> createState() =>
      _CustomUnderlineTextFormFieldState();
}

class _CustomUnderlineTextFormFieldState
    extends State<CustomUnderlineTextFormField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {}); // Rebuild the widget to update the elevation
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      style: TextStyle(
          color: widget.textColor,
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight),
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20),
      maxLines: widget.maxLines,
      obscureText: widget.obscureText ?? false,
      cursorColor: widget.cursorColor,
      cursorWidth: 1,
      readOnly: widget.readOnly,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      buildCounter: (BuildContext context,
              {int? currentLength, bool? isFocused, int? maxLength}) =>
          null,
      decoration: InputDecoration(
        suffixIcon: widget.obscureText == true
            ? IconButton(
                onPressed: widget.onSuffixIconPressed,
                icon: const Icon(
                  Icons.visibility,
                ),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: widget.fontSize,
          color: widget.hintTextColor,
          fontWeight: widget.hintTextFontWeight,
        ),
        contentPadding:
            widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 10),
        enabled: widget.enabled,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
      validator: widget.validator,
    );
  }
}

class CustomNoBorderTextFormField extends StatefulWidget {
  final String hintText;
  final int? hintTextSize;
  final FontWeight? hintTextWeight;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool? obscureText;
  final Function()? onSuffixIconPressed;
  final bool enabled;
  final bool readOnly;
  final int maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String value)? onChanged;

  final Function()? onTap;
  final EdgeInsets? scrollPadding;

  final EdgeInsets? contentPadding;

  final bool autofocus;
  final FocusNode? focusNode;

  const CustomNoBorderTextFormField({
    super.key,
    required this.hintText,
    this.hintTextSize,
    this.hintTextWeight,
    this.validator,
    this.controller,
    this.keyboardType,
    this.maxLines,
    this.obscureText,
    this.enabled = true,
    this.readOnly = false,
    this.maxLength = 50,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.onSuffixIconPressed,
    this.scrollPadding,
    this.contentPadding,
    this.autofocus = false,
    this.focusNode,
  });

  @override
  State<CustomNoBorderTextFormField> createState() =>
      _CustomNoBorderTextFormFieldState();
}

class _CustomNoBorderTextFormFieldState
    extends State<CustomNoBorderTextFormField> {

  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(() {
      setState(() {}); // Rebuild the widget to update the elevation
    });
  }

  @override
  void dispose() {
    widget.focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      style: boldTextStyle(
        size: widget.hintTextSize ?? 22,
        weight: widget.hintTextWeight ?? FontWeight.w700,
        color: Palette.kNeutral,
      ),
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      keyboardAppearance: Brightness.dark,
      obscureText: widget.obscureText ?? false,
      cursorColor: Palette.kPrimary.shade200,
      cursorWidth: 1,
      readOnly: widget.readOnly,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20),
      buildCounter: (BuildContext context,
              {int? currentLength, bool? isFocused, int? maxLength}) =>
          null,
      decoration: InputDecoration(
        suffixIcon: widget.obscureText == true
            ? IconButton(
                onPressed: widget.onSuffixIconPressed,
                icon: const Icon(
                  Icons.visibility,
                ),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: boldTextStyle(
          size: widget.hintTextSize ?? 22,
          weight: widget.hintTextWeight ?? FontWeight.w700,
          color: Palette.kNeutral.shade400,
        ),
        contentPadding:
            widget.contentPadding ?? const EdgeInsets.only(bottom: 2),
        enabled: widget.enabled,
        border: InputBorder.none,
      ),
      validator: widget.validator,
    );
  }
}

/// Checks if a given [input] string can be successfully parsed as an integer.
/// Returns true if the string is an integer, and false otherwise.
bool isStringAnInteger(String input) {
  // Try to parse the string as an integer
  int? parsedInt = int.tryParse(input);

  // If parsedInt is not null, then the string is an integer
  return parsedInt != null;
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

/// A custom text input formatter for formatting phone numbers.
class PhoneNumberInputFormat extends TextInputFormatter {

  final String? separator;

  PhoneNumberInputFormat({required this.separator});

  /// Formats the incoming text input to ensure it follows the pattern of a formatted phone number.
  ///
  /// This formatter should be used with a [TextField] or [TextFormField] to enforce proper phone number input.
  ///
  /// Example:
  /// ```dart
  /// TextField(
  ///   inputFormatters: [PhoneNumberInputFormat()],
  ///   decoration: InputDecoration(labelText: 'Phone Number'),
  /// )
  /// ```
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Custom formatting logic to ensure valid phone number input

    // Example: Ensure that the value is not empty and follows a formatted phone number pattern
    if (newValue.text.isNotEmpty) {
      final formattedValue = formatPhoneNumber(newValue.text);

      // Return the updated value with proper formatting
      return TextEditingValue(
        text: formattedValue,
        selection: TextSelection.collapsed(offset: formattedValue.length),
      );
    }

    // Return the original value if it is empty
    return newValue;
  }

  /// Formats the provided [phoneNumber] to ensure it follows the pattern of a formatted phone number.
  ///
  /// Returns the formatted phone number.
  String formatPhoneNumber(String phoneNumber) {
    // Remove leading zeros and non-digit characters
    String enteredData = phoneNumber
        .replaceAll(RegExp(r'^0+'), '')
        .replaceAll(RegExp(r'\D'), '');

    StringBuffer formattedData = StringBuffer();

    for (int i = 0; i < enteredData.length; i++) {
      formattedData.write(enteredData[i]);
      int index = i + 1;
      if (index % 3 == 0 && enteredData.length != index) {
        if (index < 8) formattedData.write(separator ?? '-'); // Add a space every 4 digits
      }
    }

    return formattedData.toString();
  }
}

/// A custom text input formatter for adding a rupee symbol (`₹`) at the beginning of the text input.
class RupeeInputFormatter extends TextInputFormatter {
  /// Formats the incoming text input to ensure it always starts with the rupee symbol (`₹`).
  ///
  /// This formatter should be used with a [TextField] or [TextFormField] to enforce proper rupee amount input.
  ///
  /// Example:
  /// ```dart
  /// TextField(
  ///   inputFormatters: [RupeeInputFormatter()],
  ///   decoration: InputDecoration(labelText: 'Amount'),
  /// )
  /// ```
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Prevent duplication of the rupee symbol if it already exists
    String newText = newValue.text;

    if (newText.isEmpty) {
      return newValue;
    }

    // Ensure the rupee symbol is always at the beginning
    if (!newText.startsWith('₹')) {
      newText = '₹${newText.replaceAll('₹', '')}';
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

/// A custom text input formatter for formatting credit card numbers.
class CreditCardInputFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Do not modify if cursor is at the beginning
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String enteredData = newValue.text;
    StringBuffer formattedData = StringBuffer();

    for (int i = 0; i < enteredData.length; i++) {
      formattedData.write(enteredData[i]);
      int index = i + 1;

      // Add a space every 4 digits
      if (index % 4 == 0 && enteredData.length != index) {
        formattedData.write(' ');
      }
    }

    return TextEditingValue(
      text: formattedData.toString(),
      selection:
          TextSelection.collapsed(offset: formattedData.toString().length),
    );
  }
}

/// A custom text input formatter for formatting OTP (One-Time Password) inputs.
class OTPInputFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Do not modify if cursor is at the beginning
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String enteredData = newValue.text;
    StringBuffer formattedData = StringBuffer();

    for (int i = 0; i < enteredData.length; i++) {
      formattedData.write(enteredData[i]);
      int index = i + 1;

      // Add two spaces after each character
      if (index % 1 == 0 && enteredData.length != index) {
        formattedData.write('  ');
      }
    }

    return TextEditingValue(
      text: formattedData.toString(),
      selection:
          TextSelection.collapsed(offset: formattedData.toString().length),
    );
  }
}

/// A custom text input formatter for formatting expiry date inputs.
class ExpiryDateInputFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Do not modify if cursor is at the beginning
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String enteredData = newValue.text;
    StringBuffer formattedData = StringBuffer();

    for (int i = 0; i < enteredData.length; i++) {
      formattedData.write(enteredData[i]);
      int index = i + 1;

      // Add a slash after every two digits
      if (index % 2 == 0 && enteredData.length != index) {
        formattedData.write('/');
      }
    }

    return TextEditingValue(
      text: formattedData.toString(),
      selection:
          TextSelection.collapsed(offset: formattedData.toString().length),
    );
  }
}

/// `DoubleTextInputFormatter` is a custom `TextInputFormatter` designed to restrict the input to valid integer and decimal values.
///
/// It ensures that the input matches a regular expression pattern that allows for one or more digits, optionally followed by a single decimal point and zero or more digits.
///
/// This formatter is particularly useful for text fields that require numeric input, such as price fields, where users should be able to enter both integers and decimal numbers with a single decimal point.
///
/// It prevents the user from entering more than one decimal point, ensuring that the input is always in a valid format for integers and doubles.
///
/// This class is useful in scenarios where you need to enforce a specific numeric format in a text field, such as limiting the number of decimal places or preventing the entry of non-numeric characters.
///
/// Note: This formatter does not restrict the number of digits before or after the decimal point, allowing for a wide range of numeric values.
class DoubleTextInputFormatter extends TextInputFormatter {
  static final _regex = RegExp(r'^\d*\.?\d*$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Handle the case where the field is being cleared
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Check if the new value matches the regex
    if (_regex.hasMatch(newValue.text)) {
      // Allow only one dot in the value
      final hasMultipleDots = newValue.text.split('.').length > 2;
      if (hasMultipleDots) {
        return oldValue;
      }

      // Check if the new value starts with a decimal point
      if (newValue.text.startsWith('.')) {
        // Add a leading zero before the decimal point
        final correctedValue = '0${newValue.text}';
        // Move the cursor to the end of the text
        final newSelection =
            TextSelection.collapsed(offset: correctedValue.length);
        return TextEditingValue(
          text: correctedValue,
          selection: newSelection,
        );
      }

      // If the new value is valid, return it
      return newValue;
    } else {
      // If the new value doesn't match the regex, revert to the old value
      return oldValue;
    }
  }
}

// Name input formatter. Name should also convert to titleCase
class NameInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.titleCase,
      selection: newValue.selection,
    );
  }
}

class EmailInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(emailPattern);

    if (regex.hasMatch(newValue.text) || newValue.text.isEmpty) {
      return newValue;
    } else {
      return oldValue;
    }
  }
}
