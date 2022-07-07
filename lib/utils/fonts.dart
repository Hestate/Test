import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppTypography {
  const AppTypography._();

  static const String _bebas = 'Bebas';

  static const _color = AppColors.black;

  static final font14 = TextStyle(
    color: _color,
    fontFamily: _bebas,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 14.sp,
  );

  static final font14g = TextStyle(
    color: AppColors.grey700,
    fontFamily: _bebas,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 14.sp,
  );

  static final font14bb = TextStyle(
    color: AppColors.blue,
    fontFamily: _bebas,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 14.sp,
  );

  static final font18wb = TextStyle(
    color: AppColors.white,
    fontFamily: _bebas,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 18.sp,
  );

  static final font20 = TextStyle(
    color: _color,
    fontFamily: _bebas,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 20.sp,
  );

  static final font72b = TextStyle(
    color: _color,
    fontFamily: _bebas,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 72.sp,
  );
}
