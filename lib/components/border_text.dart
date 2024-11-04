import 'package:flutter/material.dart';
import 'package:kqcnotebook/common/colors/colors.dart';

extension BordeText on Text {
  Widget addBorder(
    EdgeInsetsGeometry? padding,
    double? radius,
    Color? borderColor,
    double? borderWidth,
  ) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 0),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 1.0,
          )),
      child: this,
    );
  }
}

extension ExtensionWidget on Widget {
  Widget addGesture(VoidCallback callback) {
    return GestureDetector(
      onTap: callback,
      child: this,
    );
  }

  Widget addPadding(EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget addMargin(EdgeInsetsDirectional margin, {EdgeInsetsGeometry? padding}) {
    return Container(
      margin: margin,
      padding: padding,
      child: this,
    );
  }
}

extension ExtensionDateTime on DateTime {
  String yearMonthDay({String joinSymbol = "-"}) {
    return this.year.toString() +
        "-" +
        this.month.toString() +
        "-" +
        this.day.toString();
  }
}

Widget AcquireDivider(
    {Color? color, EdgeInsetsGeometry? margin, double? height}) {
  return Container(
    color: color ?? AppColors.divideLineColor,
    margin: margin,
    height: height,
  );
}
