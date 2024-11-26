import 'package:flutter/material.dart';
import 'package:kqcnotebook/common/colors/colors.dart';
import 'package:kqcnotebook/constants/assets.dart';
import 'package:kqcnotebook/pages/home/components/home_record_cell.dart';
import 'package:kqcnotebook/pages/home/components/home_top_widget.dart';
import 'package:kqcnotebook/pages/home/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Obx(
        () {
          return Container(
            color: AppColors.primaryBackground,
            child: Column(
              children: [
                HomeTopWidget(
                  recordBack: () => controller.entrySingleReocrdPage(),
                  month: controller.showMonth.value,
                  money: controller.totalCoast.value,
                ),
                Expanded(
                  child: controller.isExistData.value
                      ? SingleChildScrollView(
                          child: Column(
                            children: controller.keyList.length > 0
                                ? controller.keyList
                                    .map((e) => HomeRecordCell(recordList: controller.recordMap[e]))
                                    .toList()
                                : [
                                    HomeRecordCell(),
                                  ],
                          ),
                        )
                      : Expanded(
                          child: Center(
                          child: Image.asset(
                            Assets.assetsImagesRecordEmpty,
                            width: 150,
                            height: 174,
                          ),
                        )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
