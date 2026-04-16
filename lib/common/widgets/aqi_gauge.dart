import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:weather_app/common/values/constants.dart';


// Hàm lấy màu đơn sắc để tô màu cho dấu chấm
Color _getAqiColor(int value) {
  if (value <= 50) return Colors.green;
  if (value <= 100) return Colors.yellow;
  if (value <= 150) return Colors.orange;
  if (value <= 200) return Colors.red;
  if (value <= 300) return Colors.purple;
  return const Color(0xFF7E0023);
}


class AQIGauge extends StatelessWidget {
  final int aqi; // Giá trị từ 0 - 500
  final double size;

  const AQIGauge({super.key, required this.aqi, this.size = 200});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _AQIPainter(aqi: aqi.clamp(0, 500)),
    );
  }
}

class _AQIPainter extends CustomPainter {
  final int aqi;
  _AQIPainter({required this.aqi});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = 45.0;
    const strokeWidth = 14.0;

    const startAngle = math.pi * 1.5;
    const totalSweep = math.pi * 1;

    // 1. ĐỊNH NGHĨA DẢI MÀU CHUYỂN DẦN (GRADIENT)
    final colors = [
      Colors.green,          // 0-50
      Colors.yellow,         // 51-100
      Colors.orange,         // 101-150
      Colors.red,            // 151-200
      Colors.purple,         // 201-300
      const Color(0xFF7E0023), // 301-500 (Nâu đỏ)
    ];
    // Các mốc dừng tương ứng để màu sắc phân bổ đúng thang đo
    final stops = [
      0.05,
      0.10,
      0.15,
      0.20,
      0.30,
      0.40,
    ];

    final rect = Rect.fromCircle(center: center, radius: radius);

    // Shader để tạo hiệu ứng chuyển màu chạy dọc theo cung tròn
    const double backOffset = 10 * (math.pi / 180);

    final gradientShader = SweepGradient(
      colors: colors,
      stops: stops,
      startAngle: 0.0,
      endAngle: math.pi * 2 + backOffset,
      transform: GradientRotation(startAngle - backOffset),
    ).createShader(rect);

    // 2. VẼ CUNG TRÒN
    final arcPaint = Paint()
      ..shader = gradientShader
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, startAngle, totalSweep, false, arcPaint);

    // 3. VẼ DẤU CHẤM TẠI VỊ TRÍ AQI TƯƠNG ỨNG
    // Tính toán góc của điểm AQI hiện tại
    double progress = aqi / 500;
    double currentAngle = startAngle + (progress * totalSweep);

    // Tính tọa độ (x, y) của dấu chấm dựa trên bán kính và góc
    double dotX = center.dx + radius * math.cos(currentAngle);
    double dotY = center.dy + radius * math.sin(currentAngle);

    // Vẽ viền trắng cho chấm nổi bật
    canvas.drawCircle(Offset(dotX, dotY), 11, Paint()..color = Colors.white);

    // Vẽ chấm màu (màu sắc của chấm sẽ lấy theo giá trị AQI hiện tại)
    canvas.drawCircle(
        Offset(dotX, dotY),
        8,
        Paint()..color = _getAqiColor(aqi)
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

Text aqiDescription(int aqi) {
  final textStyle = Constants.content.copyWith(color: _getAqiColor(aqi));

  if (0 < aqi && aqi < 50) return Text("Tốt", style: textStyle);
  if (51 < aqi && aqi < 100) return Text("Trung bình", style: textStyle);
  if (101 < aqi && aqi < 150) return Text("Kém", style: textStyle);
  if (151 < aqi && aqi < 200) return Text("Xấu", style: textStyle);
  if (201 < aqi && aqi < 250) return Text("Rất xấu", style: textStyle);
  return Text("Nguy hại", style: textStyle);
}