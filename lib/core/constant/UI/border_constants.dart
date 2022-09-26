import 'package:bmi_calculator/core/constant/theme/theme.dart';
import 'package:flutter/material.dart';

class BorderConstant {
  static OutlineInputBorder textBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: theme.primaryColor,
      width: 1.0,
    ),
  );
}
