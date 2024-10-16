import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kqcnotebook/common/colors/colors.dart';
import 'package:kqcnotebook/components/components.dart';
import 'package:kqcnotebook/constants/assets.dart';
import 'package:kqcnotebook/pages/app_my_section/components/mine_left_right_cell.dart';
import 'mine_setup_controller.dart';

class MineSetupPage extends GetView<MineSetupController> {
  const MineSetupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarBackgroundColor: AppColors.primaryBackground,
      title: "设置",
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        color: AppColors.primaryBackground,
        child: Column(
          children: [
            companyPartWidget(),
            accountPartSection(),
            Row(
              children: [
                Expanded(
                  child: quitBtn(),
                ),
              ],
            ),
            // SizedBox.expand(),
          ],
        ),
      ),
    );
  }

  Widget companyPartWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.whiteColor,
      ),
      child: Column(
          children: [0, 1, 2]
              .map(
                (e) => normalCellWidget(
                  controller.list[0][e],
                  e,
                  0,
                ),
              )
              .toList()),
    );
  }

  Widget accountPartSection() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.whiteColor,
      ),
      child: Column(
          children: [0, 1, 2]
              .map(
                (e) => normalCellWidget(
                  controller.list[1][e],
                  e,
                  1,
                ),
              )
              .toList()),
    );
  }

  Widget quitBtn() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        "退出登陆",
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: AppColors.assistColorRed,
        ),
      ),
    ).addGesture(
      () => controller.quitLoginMethod(),
    );
  }

  Widget normalCellWidget(String title, int index, int section) {
    return MineLeftRightCell(
      leftWidgt: Text(
        title,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryTextColor,
        ),
      ),
      rightWidget: Image.asset(
        Assets.assetsImagesRightGreyArrow,
        width: 12,
        height: 12,
      ),
      padding: EdgeInsets.all(16),
      isShowBottomLine: index < controller.list[section].length - 1,
      callback: () => controller.entryPage(index, section),
    );
  }
}
