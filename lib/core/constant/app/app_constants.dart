import 'package:bmi_calculator/core/constant/language/lang.dart';
import 'package:get/get.dart';

class AppConstants {
  static AppConstants? _instace;

  static AppConstants get instance => _instace ??= AppConstants._init();

  AppConstants._init();

  String get APP_NAME => LanguageConstant.BMI.tr;
}
