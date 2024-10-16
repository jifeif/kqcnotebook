import 'package:get/get.dart';
import 'package:kqcnotebook/router/app_pages.dart';

class MineSetupController extends GetxController {
  final list = [
    [
      "关于甘草",
      "医生协议",
      "隐私政策",
    ],
    [
      "修改密码",
      "修改昵称",
      "注销账号",
    ],
  ];

  @override
  void onInit() {
    super.onInit();
  }

  void entryPage(int index, int section) {
    if (section == 1 && index == 1) {
      Get.toNamed(AppRoutes.MineChange);
    }
  }

  quitLoginMethod() {

  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
