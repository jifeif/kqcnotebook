import 'package:get/get.dart';
import 'package:kqcnotebook/pages/app_my_section/mine/mine_view.dart';
import 'package:kqcnotebook/pages/home/home_view.dart';

class NoteEntryController extends GetxController {
    final currentIndex = 0.obs;

    var list = [
      HomePage(),
      MinePage(),
      HomePage()
    ];

    @override
    void onInit() {
    super.onInit();
    }

    @override
    void onReady() {}

    @override
    void onClose() {}
}
