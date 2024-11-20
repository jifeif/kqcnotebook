import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kqcnotebook/common/colors/colors.dart';
import 'package:kqcnotebook/components/components.dart';
import 'package:kqcnotebook/pages/app_my_section/components/mine_up_down_cell.dart';
import 'single_record_controller.dart';

class SingleRecordPage extends GetView<SingleRecordController> {
  const SingleRecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Container(
            color: AppColors.whiteColor,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Obx(() => topWidget()),
                  ),
                ),
                KqcBtnWidget(
                  title: "确 定",
                  margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  callback: () => controller.saveRecord(),
                ),
              ],
            ),
          ).addGesture(() => FocusScope.of(context).unfocus()),
          Obx(() => typeSelectWidget()),
        ],
      ),
    );
  }

  Widget topWidget() {
    Widget wid = Container(
      margin: EdgeInsets.fromLTRB(16, Get.mediaQuery.viewPadding.top, 16, 0),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                controller.selectTypeModel.value.icon,
                width: 40,
                height: 40,
                errorBuilder: (con, obj, sta) => Container(
                  width: 40,
                  height: 40,
                  color: AppColors.divideLineColor,
                ),
              )
                  .addPadding(
                EdgeInsets.symmetric(
                  vertical: 10,
                ),
              )
                  .addGesture(() {
                controller.scale = 1.0;
                controller.showTypeSelect.value =
                    !controller.showTypeSelect.value;
              }),
              Text(
                controller.selectTypeModel.value.name.length > 0
                    ? controller.selectTypeModel.value.name
                    : "请选择",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor,
                ),
              ).paddingOnly(left: 10),
              Expanded(child: Container()),
              Container(
                width: 150,
                child: TextField(
                  controller: controller.priceCon,
                  focusNode: controller.priceNode,
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.numberWithOptions(signed: false ,decimal: true),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColorA56D5F,
                  ),
                  
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    counterText: "",
                  ),
                  maxLength: 12,
                ),
              ),
            ],
          ),
          AcquireDivider(height: 1),
          TextField(
            controller: controller.introduceCon,
            focusNode: controller.introduceNode,
            maxLength: 100,
            decoration: InputDecoration(
              border: InputBorder.none,
              counterText: "",
              hintText: "请输入备注",
              hintStyle:
                  TextStyle(fontSize: 14, color: AppColors.promptTextColor),
            ),
            style: TextStyle(
              fontSize: 14,
              color: AppColors.primarySecondTextColor,
            ),
          ),
          AcquireDivider(height: 1),
          dateSelectWidget(),
        ],
      ),
    );
    return wid;
  }

  //MARK: 类型选择
  Widget typeSelectWidget() {
    List<Widget> list = [];
    for (var typeModel in controller.mapList) {
      list.add(
        MineUpDownCell(
            padding: EdgeInsets.all(12),
            upWidget: Image.asset(
              typeModel.icon,
              width: 30,
              height: 30,
            ),
            downWidget: Text(
              typeModel.name,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.primaryTextColor,
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.divideLineColor,
                )),
            callback: () {
              controller.scale = 0.0;
              controller.selectTypeModel.value = typeModel;
              controller.showTypeSelect.value = false;
              controller.selectTypeModel.refresh();
            }),
      );
    }
    return Visibility(
      visible: controller.showTypeSelect.value,
      child: AnimatedScale(
        scale: controller.scale,
        duration: Duration(milliseconds: 200),
        child: Container(
          margin: EdgeInsets.fromLTRB(
              16, Get.mediaQuery.viewPadding.top + 24 + 40, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(left: 32),
                child: CustomPaint(
                  painter:
                      TrianglePainter(fillColor: AppColors.divideLineColor),
                  size: Size(10, 10),
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.divideLineColor,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: list,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //MARK: 时间选择
  Widget dateSelectWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: controller.otherBtnSelect.value
                  ? AppColors.primaryColorA56D5F
                  : AppColors.assistTextColor,
            ),
          ),
          child: Text(
            controller.otherBTNTitle(),
            style: TextStyle(
              fontSize: 14,
              color: controller.otherBtnSelect.value
                  ? AppColors.primaryColorA56D5F
                  : AppColors.assistTextColor,
              fontWeight: controller.otherBtnSelect.value
                  ? FontWeight.w500
                  : FontWeight.w400,
            ),
          ),
        ).addGesture(() {
          controller.toadySelect.value = false;
          controller.yesterdaySelect.value = false;
          controller.otherBtnSelect.value = true;
          selectDatePicker();
        }),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          margin: EdgeInsets.fromLTRB(8, 10, 0, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: controller.yesterdaySelect.value
                  ? AppColors.primaryColorA56D5F
                  : AppColors.assistTextColor,
            ),
          ),
          child: Text(
            "昨天",
            style: TextStyle(
              fontSize: 14,
              color: controller.yesterdaySelect.value
                  ? AppColors.primaryColorA56D5F
                  : AppColors.assistTextColor,
              fontWeight: controller.yesterdaySelect.value
                  ? FontWeight.w500
                  : FontWeight.w400,
            ),
          ),
        ).addGesture(() => controller.clickYesterDayBTN()),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          margin: EdgeInsets.fromLTRB(8, 10, 0, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: controller.toadySelect.value
                  ? AppColors.primaryColorA56D5F
                  : AppColors.assistTextColor,
            ),
          ),
          child: Text(
            "今天",
            style: TextStyle(
              fontSize: 14,
              color: controller.toadySelect.value
                  ? AppColors.primaryColorA56D5F
                  : AppColors.assistTextColor,
              fontWeight: controller.toadySelect.value
                  ? FontWeight.w500
                  : FontWeight.w400,
            ),
          ),
        ).addGesture(() {
          controller.selectDate.value = DateTime.now().yearMonthDay();
          controller.toadySelect.value = true;
          controller.yesterdaySelect.value = false;
          controller.otherBtnSelect.value = false;
        }),
      ],
    );
  }

  //MARK: 日期选择起
  selectDatePicker() async {
    DateTime? dt = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(2010),
      lastDate: DateTime(2180),
      currentDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData().copyWith(
              datePickerTheme: DatePickerThemeData(
                  backgroundColor: Colors.white,
                  headerBackgroundColor: Colors.white,
                  headerForegroundColor: AppColors.primaryTextColor,
                  dayForegroundColor:
                      WidgetStatePropertyAll(AppColors.primaryTextColor),
                  todayForegroundColor:
                      WidgetStatePropertyAll(AppColors.primaryTextColor),
                  cancelButtonStyle: ButtonStyle(
                    foregroundColor:
                        WidgetStatePropertyAll(AppColors.primaryColorA56D5F),
                    textStyle: WidgetStatePropertyAll(
                      TextStyle(fontSize: 14, color: AppColors.assistTextColor),
                    ),
                  ),
                  confirmButtonStyle: ButtonStyle(
                    foregroundColor:
                        WidgetStatePropertyAll(AppColors.primaryColor),
                    textStyle: WidgetStatePropertyAll(
                      TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                  ),
                  todayBackgroundColor: WidgetStateProperty.resolveWith(
                    (states) => states.contains(WidgetState.selected)
                        ? AppColors.primaryColor
                        : null,
                  ),
                  dayBackgroundColor: WidgetStateProperty.resolveWith(
                    (states) => states.contains(WidgetState.selected)
                        ? AppColors.primaryColorA56D5F
                        : null,
                  ))),
          child: child ?? SizedBox.shrink(),
        );
      },
    );
    if (dt != null) {
      controller.selectDate.value = dt.yearMonthDay();
      print(dt.toString());
    }
  }
}
