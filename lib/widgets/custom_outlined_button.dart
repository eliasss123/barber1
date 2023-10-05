import 'package:barber_app1/core/app_export.dart';
import 'package:barber_app1/widgets/base_button.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final TextStyle? buttonTextStyle;
  final ButtonStyle? buttonStyle;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final Alignment? alignment;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final bool? isDisabled;
  final BoxDecoration? decoration;

  CustomOutlinedButton({
    Key? key,
    required this.text,
    this.onTap,
    this.buttonTextStyle,
    this.buttonStyle,
    this.margin,
    this.height,
    this.width,
    this.alignment,
    this.leftIcon,
    this.rightIcon,
    this.isDisabled,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: buildOutlinedButtonWidget,
          )
        : buildOutlinedButtonWidget;
  }

  Widget get buildOutlinedButtonWidget => Container(
        height: height ?? 70,
        width: width ?? double.infinity,
        margin: margin,
        decoration: decoration,
        child: OutlinedButton(
          style: buttonStyle,
          onPressed: isDisabled ?? false ? null : onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text,
                style: buttonTextStyle ?? CustomTextStyles.titleLargeAndadaProWhiteA700,
              ),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
      );
}
