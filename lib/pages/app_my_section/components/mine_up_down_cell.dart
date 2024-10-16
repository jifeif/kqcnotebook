import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kqcnotebook/components/components.dart';

// ignore: must_be_immutable
class MineUpDownCell extends StatelessWidget {
  MineUpDownCell({
    Key? key,
    required this.upWidget,
    required this.downWidget,
    required this.callback,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.decoration,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.middleSpacing,
  });

  double? width;
  double? height;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  // 对齐方式
  CrossAxisAlignment crossAxisAlignment;
  // up down 组件之间的间距
  double? middleSpacing;
  BoxDecoration? decoration;
  Widget upWidget;
  Widget downWidget;
  VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      decoration: decoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          upWidget,
          SizedBox(height: middleSpacing ?? 0),
          downWidget,
        ],
      ),
    ).addGesture(callback);
  }
}


