import 'package:bmi_calculator/core/base/state/base_state.dart';
import 'package:bmi_calculator/core/constant/UI/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends BaseState<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('information'.tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildPadding(),
            buildDataRow('0 - 18,4', 'thin'.tr),
            buildDataRow('18,5 - 24,9', 'normal'.tr),
            buildDataRow('25,0 - 29,9', 'overweight'.tr),
            buildDataRow('30,0 - 34,9', 'obese_1'.tr),
            buildDataRow('35,0 - 44,9', 'obese_2'.tr),
            buildDataRow('45,0 - ∞', 'fat'.tr),
            buildPadding(),
            Padding(
              padding: Paddings.infoText,
              child: Text(
                'about_bmi'.tr,
                style: themeData.textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildPadding() {
    return SizedBox(
      height: dynamicHeight(0.05),
    );
  }

  Padding buildDataRow(String data, String type) {
    return Padding(
      padding: Paddings.infoRows,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(data),
          Text(
            type,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
