import 'package:get/get.dart';
import 'package:kqcnotebook/constants/assets.dart';
import 'package:kqcnotebook/pages/app_my_section/mine/mine_model.dart';
import 'package:kqcnotebook/router/app_pages.dart';

class MineController extends GetxController {
  final List<MineCommonServeModel> mineCommonServeList = [
    MineCommonServeModel("我的收入", Assets.assetsImagesMyIncromIcon, true),
    MineCommonServeModel("助理账号", Assets.assetsImagesMyAssistentIcon, false),
    MineCommonServeModel("操作手册", Assets.assetsImagesMyAssistentIcon, false),
    MineCommonServeModel("我的收入", Assets.assetsImagesMyAssistentIcon, false),
  ];

  final List<MineCommonServeModel> mineCommonToolList = [
    MineCommonServeModel("服务设置", Assets.assetsImagesMyListSetup, true),
    MineCommonServeModel("资质认证", Assets.assetsImagesMyListVerify, true),
    // MineCommonServeModel("邀请医生", Assets.assetsImagesMyListVerify, false),
    // MineCommonServeModel("服务日报", Assets.assetsImagesMyListVerify, false),
    MineCommonServeModel("感谢信/锦旗", Assets.assetsImagesMyListLetter, false),
    MineCommonServeModel("互联网备案", Assets.assetsImagesMyListVerify, false),
    // MineCommonServeModel("地址管理", Assets.assetsImagesMyListVerify, false),
    MineCommonServeModel("内存", Assets.assetsImagesMyListVerify, false),
    MineCommonServeModel("版本号", Assets.assetsImagesMyListVerify, false),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  ///
  void entrySetupPage() {
    Get.toNamed(AppRoutes.MineSetup);
  }

  ///
  void entryCommonServe(int index) {
    print(index);
  }

  ///
  void entryCommonTool(int index) {
    print(index);
  }


  @override
  void onClose() {}
}
