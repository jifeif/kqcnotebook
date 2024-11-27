import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  Widget addMargin(EdgeInsetsDirectional margin,
      {EdgeInsetsGeometry? padding}) {
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

extension ExtensionDigitFormat on String {
  String toFixedDigit(int fractionDigits) {
    if (this.isEmpty) {
      return "0.00";
    }
    return double.parse(this).toStringAsFixed(fractionDigits).toString();
  }

  bool isSameMonth(int mon, {int? year}) {
    List list = this.split("-");
    if (list.length > 2) {
      if (year != null) {
        return int.parse(list[0]) == year && int.parse(list[1]) == mon;
      } else {
        return int.parse(list[1]) == mon;
      }
    }
    return false;
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
