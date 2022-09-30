import 'dart:io';
import 'package:bmi_calculator/core/constant/app/app_constants.dart';
import 'package:bmi_calculator/core/constant/language/lang.dart';
import 'package:bmi_calculator/core/constant/language/locale_lang.dart';
import 'package:bmi_calculator/core/constant/route/route_names.dart';
import 'package:bmi_calculator/core/constant/theme/theme.dart';
import 'package:bmi_calculator/core/init/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'core/init/language/language.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        LocaleLanguage.TURKISH,
        LocaleLanguage.ENGLISH,
        LocaleLanguage.FRENCH,
        LocaleLanguage.SPANISH,
        LocaleLanguage.GERMAN,
      ],
      debugShowCheckedModeBanner: false,
      locale: Locale(Platform.localeName),
      fallbackLocale: LocaleLanguage.ENGLISH,
      onGenerateTitle: (BuildContext context) => LanguageConstant.BMI.tr,
      initialRoute: RouteNames.PARAMETER_PAGE,
      theme: theme,
      getPages: routeList,
    );
  }
}
