import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kqcnotebook/common/colors/colors.dart';
import 'package:kqcnotebook/components/components.dart';
import 'package:kqcnotebook/pages/app_my_section/components/horizontal_scroll_view.dart';
import 'chart_brower_controller.dart';
import 'package:fl_chart/fl_chart.dart';
class ChartBrowerPage extends GetView<ChartBrowerController> {
  const ChartBrowerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return BaseScaffold(
          title: controller.showTitle.value,
          body: Center(
            child: pieChartWidget(),
          ),
        );
      },
    );
  }

  Widget pieChartWidget() {
    String info = "";
    List<PieChartSectionData> list = [];
    if (controller.monthTypeList.length > 0) {
      for (String type in controller.monthTypeList) {
        PieChartSectionData aSectionData = PieChartSectionData(
            value: (controller.monthCostMap[type]! / controller.monthTotalCoast) * 360, color: AppColors.randomColor(), title: type);
        info += type + ": ¥" + (controller.monthCostMap[type]).toString() + "\n";
        list.add(aSectionData);
      }
    } else {
      PieChartSectionData aSectionData =
          PieChartSectionData(value: 0.33 * 360, color: Colors.red, title: "a");
      PieChartSectionData bSectionData = PieChartSectionData(
          value: 0.33 * 360, color: Colors.green, title: "b");
      PieChartSectionData cSectionData = PieChartSectionData(
          value: 0.33 * 360, color: Colors.blue, title: "c");
      list = [aSectionData, bSectionData, cSectionData];
    }
    PieChartData chartData = PieChartData(sections: list, sectionsSpace: 4, pieTouchData: PieTouchData(enabled: true, touchCallback: (eve, res){
      print(eve);
      print(res);
    }));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [   
        HorizontalScrollView(),     
        Container(
          width: 300,
          height: 300,
          child: PieChart(chartData),
        ),
        Container(
          padding: EdgeInsets.only(top: 15),
          child: Text(info, style: TextStyle(fontSize: 14, color: AppColors.promptTextColor),),
        )
      ],
    );
  }
}
