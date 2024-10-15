import 'package:flutter/material.dart';
import 'package:kqcnotebook/common/colors/colors.dart';
import 'package:kqcnotebook/pages/app_my_section/components/mine_up_down_cell.dart';
import 'package:kqcnotebook/pages/app_my_section/mine/mine_model.dart';

class MineUpimageDowntextCell extends StatelessWidget {
  const MineUpimageDowntextCell(
    this.model,
    this.callback,
  );
  final MineCommonServeModel model;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    Widget cell = MineUpDownCell(
      upWidget: Image.asset(
        model.iconName,
        width: 32,
        height: 32,
      ),
      downWidget: Text(
        model.name,
        maxLines: 1,
        style: TextStyle(
          fontSize: 14,
          color: AppColors.primaryTextColor,
        ),
      ),
      middleSpacing: 4,
      decoration: BoxDecoration(color: AppColors.whiteColor),
      padding: EdgeInsets.symmetric(horizontal: 2),
      callback: callback,
    );
    if (model.isValid) {
      return cell;
    } else {
      return Opacity(
        opacity: 0.6,
        child: cell,
      );
    }
  }
}
