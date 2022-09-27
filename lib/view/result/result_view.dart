import 'package:bmi_calculator/core/base/state/base_state.dart';
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
          duration: const Duration(milliseconds: 1200),
          height: dynamicHeight(controller.bottomAppBar.value),
          curve: Curves.elasticInOut,
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
                      Text(
                        controller.result.toString(),
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                              color: Colors.white,
                            ),
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
