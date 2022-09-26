import 'dart:io';
import 'package:bmi_calculator/core/constant/language/locale_lang.dart';
import 'package:bmi_calculator/core/constant/route/route_names.dart';
import 'package:bmi_calculator/core/constant/theme/theme.dart';
import 'package:bmi_calculator/core/init/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/init/language/language.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      debugShowCheckedModeBanner: false,
      locale: Locale(Platform.localeName),
      fallbackLocale: LocaleLanguage.ENGLISH,
      title: 'bmi'.tr,
      initialRoute: RouteNames.PARAMETER_PAGE,
      theme: theme,
      getPages: routeList,
    );
  }
}
