import 'package:auth_app/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTypography {
  const AppTypography._();

  static const _color = AppColors.black;

  static const String _appFonts = 'App Fonts';

  static const font14 = TextStyle(
    color: _color,
    fontStyle: FontStyle.normal,
    fontFamily: _appFonts,
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );

    static const font14g = TextStyle(
    color: AppColors.grey700,
    fontStyle: FontStyle.normal,
    fontFamily: _appFonts,
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );

  static const font14bb = TextStyle(
    color: AppColors.blue,
    fontStyle: FontStyle.normal,
    fontFamily: _appFonts,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  static const font18wb = TextStyle(
    color: AppColors.white,
    fontStyle: FontStyle.normal,
    fontFamily: _appFonts,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const font20 = TextStyle(
    color: _color,
    fontStyle: FontStyle.normal,
    fontFamily: _appFonts,
    fontWeight: FontWeight.normal,
    fontSize: 20,
  );

  static const font36b = TextStyle(
    color: _color,
    fontStyle: FontStyle.normal,
    fontFamily: _appFonts,
    fontWeight: FontWeight.bold,
    fontSize: 36,
  );
}
