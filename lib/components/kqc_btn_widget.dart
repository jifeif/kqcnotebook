import 'package:flutter/material.dart';
import 'package:kqcnotebook/common/colors/colors.dart';
import 'package:kqcnotebook/components/border_text.dart';

// ignore: must_be_immutable
class KqcBtnWidget extends StatelessWidget {
  KqcBtnWidget({
    Key? key,
    this.height = 44,
    this.color = AppColors.primaryColor,
    this.radius = 8,
    required this.title,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
    this.textColor,
    required this.callback,
    this.padding,
    this.margin,
  });
  double? height;
  Color? color;
  double radius;
  String title;
  double? fontSize;
  FontWeight? fontWeight;
  Color? textColor;
  VoidCallback callback;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor ?? AppColors.primaryTextColor,
        ),
      ),
    ).addGesture(callback);
  }
}
