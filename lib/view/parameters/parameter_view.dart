import 'package:bmi_calculator/core/animation/animated_clip_rect.dart';
import 'package:bmi_calculator/core/base/state/base_state.dart';
import 'package:bmi_calculator/core/base/view/base_view.dart';
import 'package:bmi_calculator/core/constant/UI/animation_constants.dart';
import 'package:bmi_calculator/core/constant/UI/button_constants.dart';
import 'package:bmi_calculator/core/constant/UI/padding.dart';
import 'package:bmi_calculator/core/constant/UI/text_field_decoration.dart';
import 'package:bmi_calculator/core/constant/language/lang.dart';
import 'package:bmi_calculator/core/constant/route/route_names.dart';
import 'package:bmi_calculator/core/constant/theme/theme.dart';
import 'package:bmi_calculator/core/init/route/route_manager.dart';
import 'package:bmi_calculator/view/result/result_view.dart';
import 'package:bmi_calculator/view/view-controller/app_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParameterPage extends StatefulWidget {
  const ParameterPage({Key? key}) : super(key: key);

  @override
  State<ParameterPage> createState() => _ParameterPageState();
}

class _ParameterPageState extends BaseState<ParameterPage> {
  AppViewConroller controller = Get.put(AppViewConroller());

  @override
  Widget build(BuildContext context) {
    return BaseView(onPageBuilder: (context) {
      return Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                Padding(
                  padding: Paddings.textFormField,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildHeight(controller.isMetricUnit.value ? LanguageConstant.CM.tr : LanguageConstant.INCHES.tr),
                      buildPadding(),
                      buildWeight(controller.isMetricUnit.value ? LanguageConstant.KG.tr : LanguageConstant.POUND.tr),
                    ],
                  ),
                ),
                buildSwitchUnit(),
                buildPadding(),
                buildSwitchGender()
              ],
            ),
          ),
        ),
        bottomNavigationBar: const ResultPage(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: buildFloatActionButton(context),
      );
    });
  }

  SizedBox buildPadding() {
    return SizedBox(
      height: Paddings.distance,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(LanguageConstant.BMI.tr),
      actions: [
        IconButton(
          onPressed: () {
            RouteManager.normalRoute(RouteNames.INFO_PAGE);
          },
          icon: const Icon(Icons.info_outline),
        ),
      ],
    );
  }

  Visibility buildFloatActionButton(BuildContext context) {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
      child: FloatingActionButton(
        elevation: ButtonsConstants.elevation,
        onPressed: () {
          controller.isResultOpen.value = !controller.isResultOpen.value;
          controller.calculateBMI();
          controller.calculateidealWeight();
        },
        child: const Icon(
          Icons.accessibility_new_sharp,
          color: Colors.white,
        ),
      ),
    );
  }

  AnimatedClipRect buildSwitchUnit() {
    return AnimatedClipRect(
      duration: AnimationConstants.duration,
      curve: AnimationConstants.curve,
      reverseDuration: AnimationConstants.duration,
      reverseCurve: AnimationConstants.curve,
      open: !controller.isResultOpen.value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildUnitButton(LanguageConstant.METRIC_UNITS.tr, controller.isMetricUnit.isTrue, true),
          buildUnitButton(LanguageConstant.US_UNITS.tr, controller.isMetricUnit.isFalse, false),
        ],
      ),
    );
  }

  AnimatedClipRect buildSwitchGender() {
    return AnimatedClipRect(
      duration: AnimationConstants.duration,
      curve: AnimationConstants.curve,
      reverseDuration: AnimationConstants.duration,
      reverseCurve: AnimationConstants.curve,
      open: !controller.isResultOpen.value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildGenderButton(LanguageConstant.MALE.tr, controller.isMale.isTrue, true, Colors.blue),
          buildGenderButton(LanguageConstant.FEMALE.tr, controller.isMale.isFalse, false, Colors.pink),
        ],
      ),
    );
  }

  SizedBox buildGenderButton(String label, bool isMale, bool type, Color color) {
    return SizedBox(
      height: ButtonsConstants.height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color.withOpacity(isMale ? ButtonsConstants.selected : ButtonsConstants.unSelected),
          elevation: ButtonsConstants.elevation,
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        onPressed: () {
          controller.isMale.value = type;
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(LanguageConstant.MALE.tr == label ? Icons.male : Icons.female),
            Text(label),
          ],
        ),
      ),
    );
  }

  SizedBox buildUnitButton(String label, bool isMetricUnit, bool type) {
    return SizedBox(
      height: ButtonsConstants.height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary:
              theme.primaryColor.withOpacity(isMetricUnit ? ButtonsConstants.selected : ButtonsConstants.unSelected),
          elevation: ButtonsConstants.elevation,
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        onPressed: () {
          controller.isMetricUnit.value = type;
        },
        child: Text(label),
      ),
    );
  }

  Row buildHeight(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: TextFormField(
            textInputAction: TextInputAction.next,
            onChanged: (value) {
              controller.height.value = double.tryParse(value.replaceAll(",", "")) ?? 0.0;
            },
            decoration: TextFieldDecoration().decoration(label),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }

  Row buildWeight(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: TextFormField(
            onChanged: (value) {
              controller.weight.value = double.tryParse(value.replaceAll(",", "")) ?? 0.0;
            },
            decoration: TextFieldDecoration().decoration(label),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
