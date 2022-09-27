import 'package:bmi_calculator/core/constant/theme/theme.dart';
import 'package:flutter/material.dart';

class BorderConstant {
  static OutlineInputBorder textBorder = OutlineInputBorder(
    borderRadius: BorderRadius.zero,
  
    borderSide: BorderSide(
      style: BorderStyle.solid,
      color: theme.primaryColor,
      width: 1.0,
    ),
  );
}
