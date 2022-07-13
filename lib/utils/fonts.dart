import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

abstract class AppTypography {
  static const String _bebas = 'Bebas';

  static const _color = AppColors.black;

  static final font18 = TextStyle(
    color: _color,
    fontFamily: _bebas,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 18.sp,
  );

  static final font18g = TextStyle(
    color: AppColors.grey700,
    fontFamily: _bebas,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 18.sp,
  );

  static final font18bb = TextStyle(
    color: AppColors.blue,
    fontFamily: _bebas,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 18.sp,
  );

  static final font22wb = TextStyle(
    color: AppColors.white,
    fontFamily: _bebas,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 22.sp,
  );

  static final font28 = TextStyle(
    color: _color,
    fontFamily: _bebas,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 28.sp,
  );

  static final font56b = TextStyle(
    color: _color,
    fontFamily: _bebas,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 56.sp,
  );
}
