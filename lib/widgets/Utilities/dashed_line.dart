import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DasheedLineWidget extends StatelessWidget {
  final double height;
  final Color color;
  final Axis direction;
  const DasheedLineWidget(
      {this.height = 1,
      this.color = Colors.black,
      this.direction = Axis.horizontal});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var boxWidth;
        var dashWidth;
        var dashHeight;
        var dashCount;

        if (direction == Axis.horizontal) {
          boxWidth = constraints.constrainWidth();
          dashWidth = 5.0;
          dashHeight = height;
          dashCount = (boxWidth / (2 * dashWidth)).floor();
        } else {
          boxWidth = constraints.constrainHeight();
          dashWidth = height;
          dashHeight = 5.0;
          dashCount = (boxWidth / (2 * dashHeight)).floor();
        }
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
          direction: direction,
        );
      },
    );
  }
}
