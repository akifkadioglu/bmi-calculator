import 'package:get/get.dart';

class AppViewConroller extends GetxController {
  RxDouble height = 0.0.obs;
  RxDouble bottomAppBar = 0.07.obs;
  RxBool isResultOpen = false.obs;
  RxDouble weight = 0.0.obs;
  RxBool isMetricUnit = true.obs;
  RxDouble result = 0.0.obs;

  void calculateBMI() {
    bottomAppBar.value = isResultOpen.value ? 0.5 : 0.07;
    if (isMetricUnit.value) {
      result.value = weight.value / ((height.value / 100) * (height.value / 100));
    } else {
      result.value = (weight.value / (height.value * height.value)) * 703;
    }
    if (result.isNaN) {
      result.value = 0.0;
    }
    result.value = double.tryParse(result.value.toStringAsFixed(2)) ?? 0.0;
  }
}
