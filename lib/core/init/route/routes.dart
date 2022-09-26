import 'package:bmi_calculator/core/constant/route/route_names.dart';
import 'package:bmi_calculator/core/constant/transition/transition_constant.dart';
import 'package:bmi_calculator/view/parameters/parameter_view.dart';
import 'package:bmi_calculator/view/result/result_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<GetPage> routeList = [
  buildRoutePage(
    RouteNames.PARAMETER_PAGE,
    const ParameterPage(),
  ),
  buildRoutePage(
    RouteNames.RESULT_PAGE,
    const ResultPage(),
  ),
];

GetPage<dynamic> buildRoutePage(String path, Widget page) {
  return GetPage(
    name: path,
    page: () => page,
    curve: Curves.easeInSine,
    transition: TransitionConstant.transitionForPage,
    transitionDuration: TransitionConstant.durationForPage,
  );
}
