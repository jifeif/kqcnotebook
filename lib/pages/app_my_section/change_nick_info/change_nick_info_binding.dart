import 'package:get/get.dart';
import 'change_nick_info_controller.dart';

class ChangeNickInfoBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<ChangeNickInfoController>(() => ChangeNickInfoController());
    }
}
