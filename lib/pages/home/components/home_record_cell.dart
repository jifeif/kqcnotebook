import 'package:flutter/material.dart';
import 'package:kqcnotebook/common/colors/colors.dart';
import 'package:kqcnotebook/components/border_text.dart';
import 'package:kqcnotebook/pages/home/home_model.dart';

// ignore: must_be_immutable
class HomeRecordCell extends StatelessWidget {
  List<SingleCoastRecord>? recordList;
  HomeRecordCell({Key? key, this.recordList});

  @override
  Widget build(BuildContext context) {
    Widget wid = Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        // image: DecorationImage(
        //     image: Image.asset(Assets.assetsImagesCellBg).image),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Text(
              recordList == null ? "2024-10-23" : recordList!.first.date,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryTextColor,
              ),
            ),
          ),
          ...acquireList(),
          AcquireDivider(
            margin: EdgeInsets.symmetric(horizontal: 16),
          ),
        ],
      ),
    );
    return wid;
  }


  List<Widget> acquireList() {
    if (recordList == null) {
      return [SingleRecordWidget()];
    }
    
    int maxCount = recordList!.length;
    int index = 0;
    return recordList!.map<SingleRecordWidget>((e){
      SingleRecordWidget wid = SingleRecordWidget(record: e, isLast: index == maxCount - 1,);
      index += 1;
      return wid;
    }).toList();
  }
}

// ignore: must_be_immutable
class SingleRecordWidget extends StatelessWidget {
  SingleCoastRecord? record;
  bool isLast;
  SingleRecordWidget({Key? key, this.record, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    Row row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              record?.type ?? "示例",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryTextColor,
              ),
            ),
            Visibility(
              visible: (record?.introduce ?? "").isNotEmpty,
              child: Container(
                padding: EdgeInsets.only(top: 3),
                child: Text(
                  record?.introduce ?? "",
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.assistTextColor,
                  ),
                ),
              ),
            )
          ],
        ),
        Text(
          "¥" + (record?.price ?? "").toFixedDigit(2),
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryTextColor,
          ),
        )
      ],
    );
    return Container(
      padding: EdgeInsets.fromLTRB(0, 2, 0, isLast ? 2 : 8),
      child: row,
    );
  }
}
