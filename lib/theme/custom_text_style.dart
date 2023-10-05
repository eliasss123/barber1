import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumGray600 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray600,
      );
  static get bodyMediumOnPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodyMediumOnPrimary_1 => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );
  static get bodySmallMontserratPrimaryContainer =>
      theme.textTheme.bodySmall!.montserrat.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w300,
      );
  // Label text style
  static get labelLargeMontserratPrimary =>
      theme.textTheme.labelLarge!.montserrat.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.5),
      );
  static get labelLargeMontserratPrimary_1 =>
      theme.textTheme.labelLarge!.montserrat.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.8),
      );
  static get labelMediumGray50001 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray50001,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumMontserratPrimary =>
      theme.textTheme.labelMedium!.montserrat.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.6),
        fontWeight: FontWeight.w600,
      );
  static get labelMediumPrimary => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static get labelSmallGray50001 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.gray50001,
        fontWeight: FontWeight.w500,
      );
  static get labelSmallWhiteA700 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 9.fSize,
        fontWeight: FontWeight.w500,
      );
  // Title text style
  static get titleLargeAndadaProWhiteA700 =>
      theme.textTheme.titleLarge!.andadaPro.copyWith(
        color: appTheme.whiteA700,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeMontserratPrimary =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 21.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBold18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumDMSans => theme.textTheme.titleMedium!.dMSans.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumDMSansPrimaryContainer =>
      theme.textTheme.titleMedium!.dMSans.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumMedium2 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 17.fSize,
        fontWeight: FontWeight.w500,
        color: Colors.black.withOpacity(0.44), // Change the color to whatever you want
      );

  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
        fontSize: 17.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumMedium19 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 19.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.36),
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumPrimaryBold => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.36),
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumPrimary_1 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.4),
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleSmallMontserratGray500 =>
      theme.textTheme.titleSmall!.montserrat.copyWith(
        color: appTheme.gray500,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallMontserratPrimary =>
      theme.textTheme.titleSmall!.montserrat.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.5),
      );
  static get titleSmallMontserratPrimaryMedium =>
      theme.textTheme.titleSmall!.montserrat.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallMontserratPrimarySemiBold =>
      theme.textTheme.titleSmall!.montserrat.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.36),
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallMontserratWhiteA700 =>
      theme.textTheme.titleSmall!.montserrat.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
      );
}

extension on TextStyle {
  TextStyle get dMSans {
    return copyWith(
      fontFamily: 'DM Sans',
    );
  }

  TextStyle get andadaPro {
    return copyWith(
      fontFamily: 'Andada Pro',
    );
  }

  TextStyle get pacifico {
    return copyWith(
      fontFamily: 'Pacifico',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }
}
