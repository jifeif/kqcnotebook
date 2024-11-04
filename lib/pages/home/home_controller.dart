import 'package:get/get.dart';
import 'package:kqcnotebook/router/app_pages.dart';

class HomeController extends GetxController {

  final isExistData = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  entrySingleReocrdPage() {
    Get.toNamed(AppRoutes.SingleRecord);
  }

  @override
  void onClose() {}

}
