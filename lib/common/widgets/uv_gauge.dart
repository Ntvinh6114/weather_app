import 'package:flutter/material.dart';
import 'package:weather_app/common/values/constants.dart';

Color _getUvColor(int uv) {
  if (uv <= 2) return Colors.green;
  if (uv <= 5) return Colors.yellow;
  if (uv <= 7) return Colors.orange;
  if (uv <= 10) return Colors.red;
  return Colors.purple;
}

class UVGauge extends StatelessWidget {
  final int uv;
  final double width;
  final double height;

  const UVGauge({
    super.key,
    required this.uv,
    this.width = 160,
    this.height = 36,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _UVPainter(
        uv: uv.clamp(0, 12),
      ),
    );
  }
}

class _UVPainter extends CustomPainter {
  final int uv;

  _UVPainter({required this.uv});

  @override
  void paint(Canvas canvas, Size size) {
    final progress = uv / 12.0;

    final trianglePath = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..close();

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final gradient = LinearGradient(
      colors: [
        Colors.green,
        Colors.yellow,
        Colors.orange,
        Colors.red,
        Colors.purple,
      ],
      stops: const [
        0.15,
        0.35,
        0.55,
        0.8,
        1.0,
      ],
    );

    final fillPaint = Paint()
      ..shader = gradient.createShader(rect);

    canvas.drawPath(trianglePath, fillPaint);

    final markerX = progress * size.width;

    final markerPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3;

    canvas.drawLine(
      Offset(markerX, 0),
      Offset(markerX, size.height),
      markerPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _UVPainter oldDelegate) {
    return oldDelegate.uv != uv;
  }
}

Text uvDescription(int uv) {
  final style = Constants.content.copyWith(
    color: _getUvColor(uv),
  );

  if (uv <= 2) return Text("Thấp", style: style);
  if (uv <= 5) return Text("Trung bình", style: style);
  if (uv <= 7) return Text("Cao", style: style);
  if (uv <= 10) return Text("Rất cao", style: style);
  return Text("Cực cao", style: style);
}