import 'package:flutter/material.dart';
import 'package:kqcnotebook/common/colors/colors.dart';
import 'package:kqcnotebook/components/border_text.dart';
import 'package:kqcnotebook/constants/assets.dart';
import 'package:kqcnotebook/pages/app_my_section/components/mine_up_down_cell.dart';

class HomeRecordCell extends StatelessWidget {
  const HomeRecordCell({Key? key});

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
              "2024-10-23",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryTextColor,
              ),
            ),
          ),
          SingleRecordWidget(),
          AcquireDivider(
            margin: EdgeInsets.symmetric(horizontal: 16),
          ),
        ],
      ),
    );
    return wid;
  }
}

class SingleRecordWidget extends StatelessWidget {
  const SingleRecordWidget({Key? key});

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
              "类别",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryTextColor,
              ),
            ),
            // SizedBox(height: 3,),
            // Text(
            //   "详细介绍下",
            //   maxLines: 2,
            //   style: TextStyle(
            //     fontSize: 13,
            //     color: AppColors.assistTextColor,
            //   ),
            // ),
          ],
        ),
        Text(
          "¥11.1",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryTextColor,
          ),
        )
      ],
    );
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: row,
    );
  }
}
