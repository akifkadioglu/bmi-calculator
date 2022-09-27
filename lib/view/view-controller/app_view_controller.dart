import 'package:get/get.dart';

class AppViewConroller extends GetxController {
  RxDouble height = 0.0.obs;
  RxDouble bottomAppBar = 0.07.obs;
  RxBool isResultOpen = false.obs;
  RxDouble weight = 0.0.obs;
  RxBool isMetricUnit = true.obs;
  RxBool isMale = true.obs;
  RxDouble result = 0.0.obs;
  RxDouble idealWeight = 0.0.obs;
  void calculateidealWeight() {
    double heightValue = isMetricUnit.value ? (height.value * 0.3937) : height.value;
    if (isMale.value && heightValue > 0) {
      idealWeight.value = 50 + 2.3 * (heightValue - 60);
    } else if (heightValue > 0) {
      idealWeight.value = 45.5 + 2.3 * (heightValue - 60);
    }
    idealWeight.value = idealWeight.value > 0 ? double.tryParse(idealWeight.value.toStringAsFixed(2)) ?? 0.0 : 0.0;
  }

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
