import 'package:flutter/material.dart';
import 'package:kqcnotebook/common/colors/colors.dart';
import 'package:kqcnotebook/components/components.dart';

class MineLeftRightCell extends StatelessWidget {
  const MineLeftRightCell({
    Key? key,
    required this.leftWidgt,
    this.rightWidget,
    this.assistView,
    this.padding,
    this.isShowBottomLine,
    this.callback,
  });
  final Widget leftWidgt;
  final Widget? rightWidget;
  final Widget? assistView;
  final EdgeInsetsGeometry? padding;
  final bool? isShowBottomLine;
  final VoidCallback? callback;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        border: isShowBottomLine == true
            ? BorderDirectional(
                bottom:
                    BorderSide(color: AppColors.divideLineColor, width: 1.0),
              )
            : null,
      ),
      child: Row(
        children: [
          Expanded(child: leftWidgt),
          assistView ?? SizedBox.shrink(),
          rightWidget ?? SizedBox.shrink(),
        ],
      ),
    ).addGesture(callback ?? (){});
  }
}
