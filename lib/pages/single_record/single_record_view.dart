import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kqcnotebook/common/colors/colors.dart';
import 'package:kqcnotebook/components/components.dart';
import 'package:kqcnotebook/constants/assets.dart';
import 'single_record_controller.dart';

class SingleRecordPage extends GetView<SingleRecordController> {
  const SingleRecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        color: AppColors.whiteColor,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: topWidget(),
              ),
            ),
            KqcBtnWidget(
              title: "保存",
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              callback: () => controller.saveRecord(),
            ),
          ],
        ),
      ),
    );
  }

  Widget topWidget() {
    Widget wid = Container(
      margin: EdgeInsets.fromLTRB(16, Get.mediaQuery.viewPadding.top, 16, 0),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                Assets.assetsImagesChi,
                width: 40,
                height: 40,
              ).addPadding(
                EdgeInsets.symmetric(
                  vertical: 10,
                ),
              ),
              Text(
                "餐饮",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                ),
              ).paddingOnly(left: 10),
              Expanded(child: Container()),
              Container(
                width: 150,
                child: TextField(
                  controller: controller.priceCon,
                  focusNode: controller.priceNode,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColorA56D5F,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    counterText: "",
                  ),
                  maxLength: 12,
                ),
              ),
            ],
          ),
          AcquireDivider(height: 1),
          TextField(
            controller: controller.introduceCon,
            focusNode: controller.introduceNode,
            maxLength: 100,
            decoration: InputDecoration(
              border: InputBorder.none,
              counterText: "",
              hintText: "请输入备注",
              hintStyle:
                  TextStyle(fontSize: 14, color: AppColors.promptTextColor),
            ),
            style: TextStyle(
              fontSize: 14,
              color: AppColors.promptTextColor,
            ),
          ),
          AcquireDivider(height: 1),
        ],
      ),
    );
    return wid;
  }

  Future<Widget?> typeSelectWidget() async {
    String str = await rootBundle.loadString(Assets.assetsFileStartCategory);
    Map<String, dynamic> map = jsonDecode(str);

    return Container(
      child: Wrap(),
    );
  }

}
