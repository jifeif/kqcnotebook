
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kqcnotebook/components/components.dart';
import 'package:kqcnotebook/constants/assets.dart';
import 'package:kqcnotebook/pages/app_my_section/mine/mine_model.dart';
import 'package:kqcnotebook/router/app_pages.dart';
import 'package:kqcnotebook/utils/utils.dart';

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

  final infoModel = AccountInfoModel("张无忌", "1991-08-06", false).obs;
  
  final image = Image.asset(
    Assets.assetsImagesMyPortrait,
    width: 60,
    height: 60,
  ).obs;

  @override
  void onInit() {
    super.onInit();
    String str = LoacalStorage().getJSON("nick") ?? "";
    if (str.length > 0) {
      infoModel.value.name = str;
    }
    acquireImage();



    KqcEventbus.on<AccountInfoModel>().listen(
     (AccountInfoModel model) async {
        infoModel.value.name = model.name;
        infoModel.refresh();
        image.value = Image(image: model.image!.image, width: 60, height: 60,);
        ;
        // // Future.delayed(Duration(seconds: 4),(){
        // //    acquireImage();
        // });
     } 
    );
  }

  Future<Image?> acquireImage() async {
    var ima = await LoacalStorage().getImage(width: 60, height: 60);
    if (ima != null) {
      image.value = ima;
      image.refresh();
    }
    return ima;
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
  void onClose() {
    EventBus().destroy();
  }
}
