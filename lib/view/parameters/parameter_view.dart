import 'package:bmi_calculator/core/constant/UI/border_constants.dart';
import 'package:bmi_calculator/core/constant/UI/padding.dart';
import 'package:bmi_calculator/core/constant/language/lang.dart';
import 'package:bmi_calculator/core/constant/route/route_names.dart';
import 'package:bmi_calculator/core/init/route/route_manager.dart';
import 'package:bmi_calculator/view/view-controller/app_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParameterPage extends StatefulWidget {
  const ParameterPage({Key? key}) : super(key: key);

  @override
  State<ParameterPage> createState() => _ParameterPageState();
}

class _ParameterPageState extends State<ParameterPage> {
  AppViewConroller controller = Get.put(AppViewConroller());
  double dynamicWidth(double value) {
    return MediaQuery.of(context).size.width * value;
  }

  double dynamicHeight(double value) {
    return MediaQuery.of(context).size.height * value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageConstant.BMI.tr),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Padding(
                padding: Paddings.textFormField,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildTextField(controller.height.value),
                    SizedBox(
                      height: dynamicHeight(0.05),
                    ),
                    buildTextField(controller.weight.value),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(LanguageConstant.US_UNITS.tr),
                  Switch(
                      value: controller.isUsMetric.value,
                      onChanged: (e) {
                        controller.isUsMetric.value = e;
                      }),
                  Text(LanguageConstant.METRIC_UNITS.tr),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        elevation: 0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: dynamicHeight(0.07),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
        child: FloatingActionButton(
          elevation: 0,
          onPressed: () {
            RouteManager.normalRoute(RouteNames.RESULT_PAGE);
          },
          child: const Icon(
            Icons.accessibility_new_sharp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Row buildTextField(double controllerValue) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onChanged: (value) {
              controllerValue = double.parse(value.replaceAll(",", ""));
            },
            decoration: InputDecoration(
              contentPadding: Paddings.contentPaddingForTextField,
              focusedBorder: BorderConstant.textBorder,
              enabledBorder: BorderConstant.textBorder,
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(
          width: dynamicWidth(0.12),
          child: Center(
            child: Text(controller.isUsMetric.value ? 'inç' : 'santim'),
          ),
        ),
      ],
    );
  }
}
