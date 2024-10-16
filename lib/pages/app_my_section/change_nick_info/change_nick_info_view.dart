import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kqcnotebook/common/colors/colors.dart';
import 'package:kqcnotebook/components/components.dart';
import 'package:kqcnotebook/constants/assets.dart';
import 'package:kqcnotebook/pages/app_my_section/components/mine_left_right_cell.dart';
import 'change_nick_info_controller.dart';

class ChangeNickInfoPage extends GetView<ChangeNickInfoController> {
  const ChangeNickInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.con = context;
    return BaseScaffold(
      appBarBackgroundColor: AppColors.primaryBackground,
      title: "更新",
      body: bodyWidget(),
    );
  }

  Widget bodyWidget() {
    return Container(
      color: AppColors.primaryBackground,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Obx(()=>mainWidget()),
          sureWidget(),
        ],
      ),
    );
  }

  Widget mainWidget() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          protraitWidget(),
          inputWidget(),
          birthdayWidget(),
        ],
      ),
    );
  }

  Widget protraitWidget() {
    return MineLeftRightCell(
      leftWidgt: Text(
        "头像",
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryTextColor,
        ),
      ),
      assistView: ClipOval(
        child: Image.asset(
          Assets.assetsImagesMyPortrait,
          width: 40,
          height: 40,
        ),
      ),
      rightWidget: Image.asset(
        Assets.assetsImagesRightGreyArrow,
        width: 12,
        height: 12,
      ),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
    );
  }

  Widget birthdayWidget() {
    return MineLeftRightCell(
      leftWidgt: Text(
        "生日",
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryTextColor,
        ),
      ),
      assistView: Text(
        controller.currentDate.value.yearMonthDay(),
        style: TextStyle(
          fontSize: 14,
          color: AppColors.assistTextColor,
        ),
      ),
      rightWidget: Image.asset(
        Assets.assetsImagesRightGreyArrow,
        width: 12,
        height: 12,
      ),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      callback: () {
        showDateSelect();
      },
    );
  }

  Widget inputWidget() {
    return MineLeftRightCell(
      leftWidgt: Text(
        "昵称",
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryTextColor,
        ),
      ),
      assistView: Text(
        "张三",
        style: TextStyle(
          fontSize: 14,
          color: AppColors.assistTextColor,
        ),
      ),
      rightWidget: Image.asset(
        Assets.assetsImagesRightGreyArrow,
        width: 12,
        height: 12,
      ),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    );
  }

  Widget sureWidget() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        "确定",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryTextColor,
        ),
      ),
    ).addGesture(() {});
  }

  //MARK: 日期选择
  showDateSelect() {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        height: 200,
        child: CupertinoDatePicker(
          itemExtent: 44,
          dateOrder: DatePickerDateOrder.ymd,
          mode: CupertinoDatePickerMode.date,
          initialDateTime: controller.currentDate.value,
          onDateTimeChanged: (date) {
            controller.currentDate.value = date;
          },
        ),
      ),
    );
  }
}