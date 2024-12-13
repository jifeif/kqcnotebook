import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:kqcnotebook/common/colors/colors.dart';
import 'package:kqcnotebook/components/border_text.dart';

class HorizontalTopScrollView extends StatefulWidget {
  const HorizontalTopScrollView();

  @override
  State<HorizontalTopScrollView> createState() => _HorizontalTopScrollViewState();
}

class _HorizontalTopScrollViewState extends State<HorizontalTopScrollView> {

  List list = [
    "2024-12",
    "2024-11",
    "2024-10",
    "2024-09",
    "2024-08",
    "2024-08",
    "",
    ""
  ];
  ScrollController? sc;


  @override
  void initState() {
    super.initState();
    sc = ScrollController(
        initialScrollOffset: (list.length - 5) * Get.width / 5);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 44,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: sc,
          itemCount: list.length,
          itemBuilder: (con, index) {
            return HorizontalScrollCell(list[index], (){
              this.switchMonth(index);
            });
          }),
    );
  }

  switchMonth(int index) {

  }
}


// ignore: must_be_immutable
class HorizontalScrollView extends StatelessWidget {

  List list = ["2024-12", "2024-11", "2024-10", "2024-09", "2024-08", "2024-08", "", ""];
  ScrollController? sc;
  HorizontalScrollView();

  @override
  Widget build(BuildContext context) {
    sc = ScrollController(initialScrollOffset: (list.length - 5) * Get.width / 5);
    return Container(
      width: Get.width,
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: sc,
        itemCount: list.length,
        itemBuilder: (con, index){
        return HorizontalScrollCell(list[index], (){});
      }),
    );
  }
}



/******************************************************/

class HorizontalScrollCell extends StatelessWidget {


  const HorizontalScrollCell(this.dateStr, this.callback);

  final String dateStr;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: Get.width / 5,
      // padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Text(this.dateStr, style: TextStyle(fontSize: 14, color: AppColors.primaryTextColor),),
      ),
    ).addGesture(callback);
  }
}