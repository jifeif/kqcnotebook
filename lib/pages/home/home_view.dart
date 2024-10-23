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
      body: Container(
        color: AppColors.primaryBackground,
        child: Column(
          children: [
            HomeTopWidget(),
            Expanded(
              child: controller.isExistData.value
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          HomeRecordCell(),
                        ],
                      ),
                    )
                  : Expanded(
                      child: Center(
                      child: Image.asset(Assets.assetsImagesRecordEmpty, width: 150, height: 174,),
                    )),
            ),
          ],
        ),
      ),
    );
  }
}
