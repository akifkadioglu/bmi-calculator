import 'package:bmi_calculator/core/base/state/base_state.dart';
import 'package:bmi_calculator/core/constant/UI/animation_constants.dart';
import 'package:bmi_calculator/view/view-controller/app_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends BaseState<ResultPage> {
  AppViewConroller controller = Get.put(AppViewConroller());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          if (controller.isResultOpen.value) {
            controller.isResultOpen.value = false;
            controller.calculateBMI();
            return false;
          } else {
            return true;
          }
        },
        child: AnimatedContainer(
          duration: AnimationConstants.duration,
          height: dynamicHeight(controller.bottomAppBar.value),
          curve: AnimationConstants.curve,
          child: BottomAppBar(
            color: Theme.of(context).primaryColor,
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            elevation: 0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: dynamicHeight(0.1),
                      ),
                      Column(
                        children: [
                          Text(
                            controller.result.toString(),
                            style: Theme.of(context).textTheme.headline1?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          Text(
                            'bmi'.tr,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: dynamicHeight(0.1),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            controller.idealWeight.toString(),
                            style: Theme.of(context).textTheme.headline3?.copyWith(
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white,
                                ),
                          ),
                          Text(
                            'ideal_weight'.tr,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
