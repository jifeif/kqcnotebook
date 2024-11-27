import 'package:get/get.dart';
import 'chart_brower_controller.dart';

class ChartBrowerBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<ChartBrowerController>(() => ChartBrowerController());
    }
}
