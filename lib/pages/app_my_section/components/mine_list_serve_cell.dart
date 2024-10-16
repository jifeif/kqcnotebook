import 'package:flutter/material.dart';
import 'package:kqcnotebook/common/colors/colors.dart';
import 'package:kqcnotebook/components/components.dart';
import 'package:kqcnotebook/constants/assets.dart';
import 'package:kqcnotebook/pages/app_my_section/mine/mine_model.dart';

class MineListServeCell extends StatelessWidget {
  MineListServeCell({
    Key? key,
    required this.model,
    required this.callback,
    this.assitView,
  });
  final MineCommonServeModel model;
  final VoidCallback callback;
  final Widget? assitView;
  @override
  Widget build(BuildContext context) {
    Widget wid = Container(
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      color: AppColors.whiteColor,
      child: Row(
        children: [
          Image.asset(
            model.iconName,
            width: 24,
            height: 24,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 4.0),
              child: Text(
                model.name,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ),
          ),
          assitView ?? SizedBox.shrink(),
          Image.asset(
            Assets.assetsImagesRightGreyArrow,
            width: 20,
            height: 20,
          ),
        ],
      ),
    ).addGesture(callback);

    if (model.isValid) {
      return wid;
    } else {
      return Opacity(opacity: 0.6, child: wid,);
    }
  }
}
