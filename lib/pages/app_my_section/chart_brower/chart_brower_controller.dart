import 'package:get/get.dart';
import 'package:kqcnotebook/components/border_text.dart';
import 'package:kqcnotebook/pages/home/home_model.dart';
import 'package:kqcnotebook/utils/utils.dart';

class ChartBrowerController extends GetxController {
  List<SingleCoastRecord> list = [];

  final keyList = [].obs;
  final recordMap = Map<String, List<SingleCoastRecord>>().obs;
  final showTitle = "当月图表".obs;

  var monthTotalCoast = 0.0;
  var monthCostMap = Map<String, double>();
  final monthTypeList = [].obs;
  @override
  void onInit() async {
    super.onInit();
    await acquireListData();
    acquireMonthKindData(12, 2024);
  }

  @override
  void onReady() {}


  acquireMonthKindData(int mon, int year) {
    List showKeyList = [];
    for (String dateStr in keyList) {
        if (dateStr.isSameMonth(mon, year: year)) {
          showKeyList.add(dateStr);
        }
    }

    List kindArr = [];
    Map<String, double> costMap = Map<String, double>();
    for (String keyStr in showKeyList) {
        List recordList = recordMap[keyStr] ?? [];
        for (SingleCoastRecord record in recordList) {
          if (kindArr.contains(record.type)) {
            double price = costMap[record.type] ?? 0.0;
            price = price + double.parse(record.price);
            costMap[record.type] = price;
          } else {
            kindArr.add(record.type);
            costMap[record.type] = double.parse(record.price);
          }
        }
    }
    double totalP = 0.0;
    for (String element in kindArr) {
      totalP += costMap[element]!;
    }

    monthTotalCoast = totalP;
    monthCostMap = costMap;
    monthTypeList.value = kindArr;
    monthTypeList.refresh();

    print(kindArr);
    print(costMap);
    print(totalP);
  }

  // 分月的全部数据列表
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
