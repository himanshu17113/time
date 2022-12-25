import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vm;

import '../costants.dart';

class ProgressRing extends StatelessWidget {
  final double progress;

  const ProgressRing({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox.expand(
          child: CustomPaint(
              painter: RingPainter(
                  strokeWidth: constraints.maxWidth * 0.14,
                  progress: progress)));
    });
  }
}

class RingPainter extends CustomPainter {
  final double strokeWidth;
  final double progress;

  RingPainter({required this.strokeWidth, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final inset = size.width * 0.1;
    // print(inset);
    // print(size.width - inset);
    // print(size.height - inset);
    final rect =
        Rect.fromLTRB(inset, inset, size.width - inset, size.width - inset);
    // final rect = Rect.fromLTRB(0, 0, 300, 300);
    canvas.drawArc(
        rect,
        vm.radians(-90),
        vm.radians(360 * progress),
        false,
        Paint()
          ..shader = LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Constants.gradientStart,
                Constants.gradientMiddle,
                Constants.gradientEnd
              ]).createShader(rect)
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round);
  }

  @override
  bool shouldRepaint(RingPainter oldDelegate) {
    if (oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth) {
      return true;
    }
    return false;
  }
}
