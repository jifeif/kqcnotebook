import 'package:flutter/material.dart';

extension BordeText on Text {
  Widget addBorder(EdgeInsetsGeometry? padding, double? radius, Color? borderColor, double? borderWidth,) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 0),
        border: Border.all(color: borderColor ?? Colors.transparent, width: borderWidth ?? 1.0, )
      ),
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
}


extension ExtensionDateTime on DateTime {
  String yearMonthDay({String joinSymbol = "-"}) {
    return this.year.toString() + "-" + this.month.toString() +  "-" + this.day.toString();
  }
}