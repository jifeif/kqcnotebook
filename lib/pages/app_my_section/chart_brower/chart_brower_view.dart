import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kqcnotebook/components/components.dart';
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

    PieChartSectionData aSectionData = PieChartSectionData(value: 0.33 * 360, color: Colors.red, title: "a");
        PieChartSectionData bSectionData = PieChartSectionData(value: 0.33 * 360, color: Colors.green, title: "b");
    PieChartSectionData cSectionData = PieChartSectionData(value: 0.33 * 360, color: Colors.blue, title: "c");

    PieChartData chartData = PieChartData(sections: [aSectionData, bSectionData, cSectionData]);

    return Container(
      width: 300,
      height: 300,
      color: Colors.grey,
      child: PieChart(chartData),
    );
  }
}
