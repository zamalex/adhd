import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class DashedLineVerticalPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size, Color color) {
//     double dashHeight = 5, dashSpace = 3, startY = 0;
//     final paint = Paint()
//       ..color = color
//       ..strokeWidth = 1;
//     while (startY < size.height) {
//       canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
//       startY += dashHeight + dashSpace;
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }