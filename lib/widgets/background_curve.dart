import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../services/home_service.dart';

class BackgroundCurveShape extends StatelessWidget {
  BackgroundCurveShape({
    Key? key,
    this.begin = 0.0,
    this.end = 0.65,
  }) : super(key: key);

  /// height in percentage
  final double begin, end;
  final service = GetIt.I.get<HomeService>();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0,
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height * 0.8,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: begin, end: end),
        duration: const Duration(milliseconds: 500),
        builder: (context, val, w) {
          return CustomPaint(
            size: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * val,
            ),
            painter: CurvePainter(
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final Color color;

  CurvePainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width * 1.2, (size.height * 0), size.width, size.height * 0.5);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
