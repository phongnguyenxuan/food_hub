import 'package:flutter/material.dart';
import 'package:style/default_color.dart';

class DefaultTextStyles {
  static const String fontFamily = "SofiaPro";
  static const TextStyle titleTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 36.41,
    height: 1.2,
    color: DefaultColors.textBlackColor,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle k14fontsizeW400grey = TextStyle(
    fontSize: 14,
    height: 1.3,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    color: DefaultColors.greyColor,
  );

  static const TextStyle titleTextFieldStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: DefaultColors.whiteTitleColor);
  static const TextStyle hintTextStyle = TextStyle(
      fontSize: 17,
      color: DefaultColors.hintTextColor,
      fontWeight: FontWeight.w400);

  static const TextStyle haveAccTextStyle = TextStyle(
      fontFamily: fontFamily,
      color: DefaultColors.textBlack50Color,
      fontSize: 14,
      fontWeight: FontWeight.w400);

  static const TextStyle googleTextStyle = TextStyle(
      color: DefaultColors.textBlackColor,
      fontFamily: fontFamily,
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.65);

  static const TextStyle titleHomeTextStyle = TextStyle(
      color: DefaultColors.titleHomeColor,
      fontSize: 30,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700);

  static const TextStyle titleHomeStyle = TextStyle(
      fontFamily: fontFamily,
      color: DefaultColors.titleHomeColor,
      fontSize: 18,
      fontWeight: FontWeight.w600);

  static const TextStyle viewAllStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: 13,
      color: DefaultColors.primaryColor,
      fontWeight: FontWeight.w400);

  static const TextStyle k16W500ColorFF5B5B5EStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      color: DefaultColors.textBlack50Color,
      fontWeight: FontWeight.w500);

  static const TextStyle k16W500PrimaryColorStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      color: DefaultColors.primaryColor,
      fontWeight: FontWeight.w500);

  static const TextStyle k20w600blackColorStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: 20,
      color: DefaultColors.blackColor,
      fontWeight: FontWeight.w600);

  static const TextStyle k14w400FF9EA1B1Color = TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      color: DefaultColors.k0xFF9EA1B1,
      fontWeight: FontWeight.w400);

  static const TextStyle k16w400blackColor = TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      color: DefaultColors.textBlackColor,
      fontWeight: FontWeight.w400);

  static const TextStyle k16w400whiteColor = TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      color: DefaultColors.whiteColor,
      fontWeight: FontWeight.w400);

  static const TextStyle k12w400whiteColor = TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      color: DefaultColors.k0xFF8A8E9B,
      fontWeight: FontWeight.w400);
}
