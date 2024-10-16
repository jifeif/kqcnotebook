import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeNickInfoController extends GetxController {
    final count = 0.obs;
    
    final currentDate = DateTime.now().obs;

    BuildContext? con;
    @override
    void onInit() {
    super.onInit();
    }

    @override
    void onReady() {}

    @override
    void onClose() {}

    increment() => count.value++;
}
