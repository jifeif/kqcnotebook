import 'package:get/get.dart';
import 'package:kqcnotebook/pages/home/home_model.dart';
import 'package:kqcnotebook/router/app_pages.dart';
import 'package:kqcnotebook/utils/utils.dart';

class HomeController extends GetxController {
  final isExistData = true.obs;

  List<SingleCoastRecord> list = [];

  final keyList = [].obs;
  final recordMap = Map<String, List<SingleCoastRecord>>().obs;
  final showMonth = "".obs;
  final totalCoast = "".obs;

  @override
  void onInit() async {
    super.onInit();
    await acquireListData();
    showMonth.value = acquireCurrentMonth();
    
  }

  @override
  void onReady() {}

  entrySingleReocrdPage() {
    Get.toNamed(AppRoutes.SingleRecord);
  }

  String acquireCurrentMonth() {
    int mon = DateTime.now().month;
    switch (mon) {
      case 1:
        return "一月";
      case 2:
        return "二月";
      case 3:
        return "三月";
      case 4:
        return "四月";
      case 5:
        return "五月";
      case 6:
        return "六月";
      case 7:
        return "七月";
      case 8:
        return "八月";
      case 9:
        return "九月";
      case 10:
        return "十月";
      case 11:
        return "十一月";
      default:
        return "十二月";
    }
  }

  acquireCurrentMonthCoast() {

  }

  acquireListData() async {
    list = await LoacalStorage().getExistCoastRecordList();

    for (SingleCoastRecord rec in list) {
      List<SingleCoastRecord> recordList = [];
      if (keyList.contains(rec.date)) {
        recordList = recordMap[rec.date]!;
      } else {
        keyList.add(rec.date);
        recordMap[rec.date] = recordList;
      }
      recordList.add(rec);
    }
    keyList.refresh();
  }

  @override
  void onClose() {}
}
