import 'package:flutter/material.dart';


class Dashedline extends StatelessWidget {
  final double height;
  final Color color;

  const Dashedline({this.height = 1, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 2.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

// class Dashedline {

//    final double step;
//   final double span;

//   const Dashedline({this.step = 2, this.span = 2,});

//   double get partLength => step + span;

//   void paint(Canvas canvas, Path path, Paint paint) {
//     PathMetrics pms = path.computeMetrics();
//     pms.forEach((PathMetric pm) {
//       final int count = pm.length ~/ partLength;
//       for (int i = 0; i < count; i++) {
//         canvas.drawPath(
//             pm.extractPath(partLength * i, partLength * i + step), paint);
//       }
//       final double tail = pm.length % partLength;
//       canvas.drawPath(pm.extractPath(pm.length-tail, pm.length), paint);
//     });
//   }  
// }