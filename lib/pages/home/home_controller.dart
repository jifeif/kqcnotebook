import 'package:get/get.dart';
import 'package:kqcnotebook/components/border_text.dart';
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
    await acquireCurrentMonthCoast(DateTime.now().month);
  }

  @override
  void onReady() {}

  entrySingleReocrdPage() async {
    dynamic record = await Get.toNamed(AppRoutes.SingleRecord);
    if (record == null) {
      return;
    }
    list.add(record);
    addOnlyRecord(record);
    await acquireCurrentMonthCoast(DateTime.now().month);
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

  acquireCurrentMonthCoast(int month) {
    double total = 0;
    for (SingleCoastRecord record in list) {
      if (record.date.isSameMonth(month)) {
        total += double.parse(record.price);
      }
    }
    totalCoast.value = total.toString().toFixedDigit(2);
  }

  // 添加单条记录
  addOnlyRecord(SingleCoastRecord record) {
    List<SingleCoastRecord> recordList = [];
    if (keyList.contains(record.date)) {
      recordList = recordMap[record.date]!;
    } else {
      keyList.add(record.date);
      recordMap[record.date] = recordList;
    }
    List<String> tempList = keyList.map<String>((e)=>e).toList();
    tempList.sort((a,b)=>b.compareTo(a));
    keyList.value = tempList;
    keyList.refresh();
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
    List<String> tempList = keyList.map<String>((e) => e).toList();
    tempList.sort((a, b) => b.compareTo(a));
    keyList.value = tempList;
    keyList.refresh();
  }

  @override
  void onClose() {}
}
