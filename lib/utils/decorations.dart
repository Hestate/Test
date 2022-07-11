import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppButtonBoxDecoration {
  static final buttonDecoration = BoxDecoration(
    color: AppColors.deepPurple,
    borderRadius: BorderRadius.circular(16),
  );
}

abstract class AppFieldBoxDecoration {
  static final fieldDecoration = BoxDecoration(
      color: AppColors.grey200,
      border: Border.all(color: AppColors.white),
      borderRadius: BorderRadius.circular(16));
}
