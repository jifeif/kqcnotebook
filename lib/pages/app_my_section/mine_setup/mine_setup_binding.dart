import 'package:get/get.dart';
import 'mine_setup_controller.dart';

class MineSetupBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<MineSetupController>(() => MineSetupController());
    }
}
