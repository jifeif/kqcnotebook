import 'package:get/get.dart';
import 'single_record_controller.dart';

class SingleRecordBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<SingleRecordController>(() => SingleRecordController());
    }
}
