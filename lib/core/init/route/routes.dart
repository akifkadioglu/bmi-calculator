import 'package:bmi_calculator/core/constant/UI/animation_constants.dart';
import 'package:bmi_calculator/core/constant/route/route_names.dart';
import 'package:bmi_calculator/core/constant/transition/transition_constant.dart';
import 'package:bmi_calculator/view/info/info_view.dart';
import 'package:bmi_calculator/view/parameters/parameter_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<GetPage> routeList = [
  buildRoutePage(
    RouteNames.PARAMETER_PAGE,
    const ParameterPage(),
  ),
  buildRoutePage(
    RouteNames.INFO_PAGE,
    const InfoPage(),
  ),
];

GetPage<dynamic> buildRoutePage(String path, Widget page) {
  return GetPage(
    name: path,
    page: () => page,
    curve: AnimationConstants.curve,
    transition: TransitionConstant.transitionForPage,
    transitionDuration: TransitionConstant.durationForPage,
  );
}
