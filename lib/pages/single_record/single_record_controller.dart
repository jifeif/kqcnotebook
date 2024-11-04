import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleRecordController extends GetxController {

    late TextEditingController priceCon;
    late TextEditingController introduceCon;
    late FocusNode priceNode;
    late FocusNode introduceNode;
    @override
    void onInit() {
    super.onInit();
      priceCon = TextEditingController(text: "¥0.00");
      introduceCon = TextEditingController();
      priceNode = FocusNode();
      introduceNode = FocusNode();
    }

    @override
    void onReady() {}

    saveRecord() {

    }

    @override
    void onClose() {}

}
