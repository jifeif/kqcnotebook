import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kqcnotebook/common/colors/colors.dart';
import 'package:kqcnotebook/components/components.dart';
import 'package:kqcnotebook/constants/assets.dart';
import 'package:kqcnotebook/pages/app_my_section/components/mine_list_serve_cell.dart';
import 'package:kqcnotebook/pages/app_my_section/components/mine_upImage_downText_cell.dart';
import 'package:kqcnotebook/utils/sp_util.dart';
import 'mine_controller.dart';

final double MinePageTopHeight = 256 + Get.mediaQuery.viewPadding.top;

class MinePage extends StatelessWidget {
  MinePage({Key? key}) : super(key: key);
  final controller = Get.put(MineController());
  @override
  Widget build(BuildContext context) {
    print(Get.mediaQuery.viewInsets);
    return Scaffold(
      body: Container(
        color: AppColors.primaryBackground,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            topWidget(),
            Flexible(child: bottomWidget()),
          ],
        ),
      ),
    );
  }

//MARK: 顶部
  Widget topWidget() {
    return Stack(
      children: [
        Container(
          width: Get.width,
          height: MinePageTopHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.assetsImagesMyTopBg),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: Get.mediaQuery.viewPadding.top - 20,
          right: 0,
          child: Image.asset(Assets.assetsImagesMyTopBgIcon),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: MinePageTopHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                setupWidget(),
                accountInfoWidget(),
                commonServeWidget(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget setupWidget() {
    return GestureDetector(
      onTap: () => controller.entrySetupPage(),
      child: Container(
        margin: EdgeInsets.only(top: Get.mediaQuery.viewPadding.top),
        width: 60,
        height: 45,
        alignment: Alignment.center,
        child: Image.asset(
          Assets.assetsImagesMySetupIcon,
          width: 32,
          height: 32,
        ),
      ),
    );
  }

  Widget accountInfoWidget() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 12, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            border: Border.all(width: 2.0, color: AppColors.whiteColor),
          ),
          child: Image.asset(
            Assets.assetsImagesMyPortrait,
            width: 62,
            height: 62,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "张那",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "主任医师",
                    style: TextStyle(
                        fontSize: 12, color: AppColors.primaryColorA56D5F),
                  ).addBorder(EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      4, AppColors.primaryColorA56D5F, .5),
                ],
              ),
              Text(
                "浙江省 杭州市",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 14.0,
                  color: AppColors.assistTextColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
      ],
    );
  }

  Widget commonServeWidget() {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: EdgeInsets.all(16),
      height: 126,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.whiteColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "常用服务",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryTextColor,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.mineCommonServeList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: (Get.width - 64 - 66 * 4) / 3,
                mainAxisExtent: 66,
              ),
              itemBuilder: (context, index) {
                var model = controller.mineCommonServeList[index];
                return MineUpimageDowntextCell(
                  model,
                  () => controller.entryCommonServe(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  //MARK: 底部
  Widget bottomWidget() {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
      alignment: Alignment.topCenter,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.whiteColor,
        // color: Colors.red,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            color: AppColors.whiteColor,
            child: Text(
              "服务工具",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: controller.mineCommonToolList.length,
              itemBuilder: (context, index) {
                return MineListServeCell(
                  model: controller.mineCommonToolList[index],
                  callback: () => controller.entryCommonTool(index),
                  assitView: index == controller.mineCommonToolList.length - 1
                      ? versionInfoWidget()
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget versionInfoWidget() {
    return Text(
      "当前版本：${SPUtil.packageInfo.version}",
      style: TextStyle(
        fontSize: 14,
        color: AppColors.promptTextColor,
      ),
    );
  }
}

class let {}
