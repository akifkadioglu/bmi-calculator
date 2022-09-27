import 'package:bmi_calculator/core/constant/UI/border_constants.dart';
import 'package:bmi_calculator/core/constant/UI/padding.dart';
import 'package:bmi_calculator/view/view-controller/app_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldDecoration {
  AppViewConroller controller = Get.put(AppViewConroller());

  InputDecoration decoration(String label) {
    return InputDecoration(
      enabled: !controller.isResultOpen.value,
      suffixIcon: Padding(
        padding: Paddings.unitBox,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label),
          ],
        ),
      ),
      hintText: '0',
      contentPadding: Paddings.contentPaddingForTextField,
      focusedBorder: BorderConstant.textBorder,
      enabledBorder: BorderConstant.textBorder,
      disabledBorder: BorderConstant.textBorder,
    );
  }
}
