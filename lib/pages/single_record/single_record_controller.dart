import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kqcnotebook/components/border_text.dart';
import 'package:kqcnotebook/constants/assets.dart';
import 'package:kqcnotebook/pages/home/home_model.dart';
import 'package:kqcnotebook/pages/single_record/single_record_model.dart';
import 'package:kqcnotebook/utils/utils.dart';

class SingleRecordController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TextEditingController priceCon;
  late TextEditingController introduceCon;
  late FocusNode priceNode;
  late FocusNode introduceNode;
  late AnimationController aniCon;
  var scale = 1.0;
  final selectDate = "".obs;
  final selectTypeModel = RecordTypeModel("", "", "", []).obs;
  final mapList = [].obs;
  final showTypeSelect = true.obs;
  final toadySelect = true.obs;
  final yesterdaySelect = false.obs;
  final otherBtnSelect = false.obs;

  @override
  void onInit() async {
    super.onInit();
    selectDate.value = DateTime.now().yearMonthDay();
    aniCon =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    priceCon = TextEditingController(text: "¥0.00");
    introduceCon = TextEditingController();
    priceNode = FocusNode()
      ..addListener(() {
        if (priceNode.hasFocus) {
          if (priceCon.text == "¥0.00") {
            priceCon.text = "¥";
          }
        }
        if (!priceNode.hasFocus && (priceCon.text == "¥")) {
          priceCon.text = "¥0.00";
        }
      });
    introduceNode = FocusNode();
    String str = await rootBundle.loadString(Assets.assetsFileStartCategory);
    List<dynamic> list = jsonDecode(str);
    mapList.value = list.map((e) => RecordTypeModel.fromJSON(e)).toList();
    aniCon.forward();
    print(mapList);
  }

  @override
  void onReady() {}

  saveRecord() async {
    var price = priceCon.text;
    if (price.contains("¥")) {
      price = price.replaceAll("¥", "");
    }
    if (price.isNotEmpty && double.parse(price) > 0) {
      SingleCoastRecord record = SingleCoastRecord(
          selectTypeModel.value.name,
          price,
          introduceCon.text,
          selectTypeModel.value.icon,
          selectDate.value);
      await LoacalStorage().saveSingleCoastRecord(record);
      Get.back(result: record);
    } else {
      Get.back();
    }
  }

  String otherBTNTitle() {
    if (otherBtnSelect.value && selectDate.value.isNotEmpty) {
      return selectDate.value;
    }
    return "其它时间";
  }

  clickYesterDayBTN() {
    DateTime dt = DateTime.now().subtract(Duration(days: 1));
    selectDate.value = dt.yearMonthDay();
    toadySelect.value = false;
    yesterdaySelect.value = true;
    otherBtnSelect.value = false;
  }

  @override
  void onClose() {
    priceNode.removeListener((){});
    FocusScope.of(Get.context!).unfocus();
  }
}
