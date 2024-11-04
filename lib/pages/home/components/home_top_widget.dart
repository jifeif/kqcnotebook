import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kqcnotebook/common/colors/colors.dart';
import 'package:kqcnotebook/components/components.dart';
import 'package:kqcnotebook/constants/assets.dart';
import 'package:kqcnotebook/pages/app_my_section/components/mine_up_down_cell.dart';

// ignore: must_be_immutable
class HomeTopWidget extends StatelessWidget {
  HomeTopWidget({
    Key? key,
    this.month = "十月",
    this.money = "1800.00",
    this.recordBack,
  });
  String month;
  String money;
  VoidCallback? recordBack;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: Image.asset(
            Assets.assetsImagesHomeBg,
            height: 200 + Get.mediaQuery.viewPadding.top,
            width: Get.width,
            fit: BoxFit.cover,
          ),
        ),
        mainWidget(),
      ],
    );
  }

  Widget mainWidget() {
    return Container(
      height: 200 + Get.mediaQuery.viewPadding.top,
      child: Column(
        children: [
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MineUpDownCell(
                upWidget: Text(
                  "月份",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
                ),
                downWidget: Text(
                  month,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.whiteColor,
                  ),
                ),
                callback: () {},
              ),
              MineUpDownCell(
                upWidget: Text(
                  "金额",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
                ),
                downWidget: Text(
                  money,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.whiteColor,
                  ),
                ),
                callback: () {},
              ),
            ],
          ),
          KqcBtnWidget(
              title: "记一笔",
              margin: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              callback: () {
                recordBack?.call();
              })
        ],
      ),
    );
  }
}
