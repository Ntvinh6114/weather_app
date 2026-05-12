import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'glass_box.dart';

// Model dữ liệu tối giản dùng Index để truy xuất
class DataPoint {
  final double value;
  final String iconPath;
  final String label;

  DataPoint({
    required this.value,
    this.iconPath = "",
    required this.label,
  });
}


class ChartController extends GetxController {
  // data
  final RxList<DataPoint> data = <DataPoint>[].obs;

  // index đang chọn
  final RxInt selectedIndex = 0.obs;

  // unit (°C, %, ...)
  final RxString unit = "".obs;

  ChartController({ required List<DataPoint> data, int index = 0, String unit = ""}) {
    this.data.assignAll(data);
    selectedIndex.value = index;
    this.unit.value = unit;
  }

  // ===== ACTION =====

  void setData(List<DataPoint> newData, {String unitValue = ""}) {
    data.assignAll(newData);
    unit.value = unitValue;

    // reset index nếu cần
    if (data.isNotEmpty) {
      selectedIndex.value = 0;
    }
  }

  void selectIndex(int index) {
    if (index < 0 || index >= data.length) return;
    selectedIndex.value = index;
  }

  // ===== DERIVED =====

  DataPoint? get selectedItem {
    if (data.isEmpty) return null;
    return data[selectedIndex.value];
  }
}


class CustomChart extends StatelessWidget {
  final String tag;
  final List<DataPoint> data;
  final int selectedIndex;
  final String unit;
  final Color lineColor;
  final Function(DataPoint data, int index) onSelect;
  final bool selectable;

  final ChartController chartCtrl;

  CustomChart({
    super.key,
    required this.tag,
    required this.data,
    this.selectedIndex = 0,
    required this.onSelect,
    this.unit = "",
    this.lineColor = Colors.yellowAccent,
    this.selectable = false,
  }) : chartCtrl = Get.put(
    ChartController(
      data: data,
      index: selectedIndex,
      unit: unit,
    ),
    tag: tag,
  );

  @override
  Widget build(BuildContext context) {
    const double colWidth = 85.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double chartHeight = constraints.maxHeight;

        return Obx(()
        {
          return SizedBox(
          height: chartHeight,
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: Stack(
                children: [
                  // ===== COLUMNS =====
                  Row(
                    children: List.generate(chartCtrl.data.length, (index) {
                      var data = chartCtrl.data[index];

                      Widget columnContent = Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: 15),
                          Text(
                            "${data.value.toInt()}$unit",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Image.asset(
                                data.iconPath,
                                width: 35,
                                height: 35,
                                errorBuilder: (_, __, ___) =>
                                const Icon(
                                    Icons.help_outline, color: Colors.white24),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                data.label,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                        ],
                      );

                      return SizedBox(
                        width: colWidth,
                        height: chartHeight,
                        child: GestureDetector(
                          onTap: () {
                            if (!selectable) return;
                            print('đã bấm $index');

                            onSelect.call(chartCtrl.data[index], index);
                            chartCtrl.selectIndex(index);
                          },
                          child: (index == chartCtrl.selectedIndex.value)
                              ? GlassBox(
                            borderRadius: 16,
                            opacity: 0.12,
                            overflow: true,
                            child: columnContent,
                          )
                              : columnContent,
                        ),
                      );
                    }),
                  ),

                  // ===== LINE =====
                  IgnorePointer(
                    ignoring: true,
                    child: CustomPaint(
                      size: Size(data.length * colWidth, chartHeight),
                      painter: _SmoothLinePainter(
                        data: data,
                        lineColor: lineColor,
                        colWidth: colWidth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),);
        });
      },
    );
  }
}


class _SmoothLinePainter extends CustomPainter {
  final List<DataPoint> data;
  final Color lineColor;
  final double colWidth;

  _SmoothLinePainter({required this.data, required this.lineColor, required this.colWidth});

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final paint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final values = data.map((e) => e.value).toList();
    final maxV = values.reduce((a, b) => a > b ? a : b);
    final minV = values.reduce((a, b) => a < b ? a : b);
    final range = (maxV - minV) == 0 ? 1.0 : (maxV - minV);

    // Tính tọa độ Y: Giới hạn dao động nhỏ (20px) để đường không quá cong
    double getY(double val) {
      double ratio = (val - minV) / range;
      return (size.height / 2) - (ratio * 20) + 10;
    }

    for (int i = 0; i < data.length; i++) {
      double x = (i * colWidth) + (colWidth / 2);
      double y = getY(data[i].value);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        double prevX = ((i - 1) * colWidth) + (colWidth / 2);
        double prevY = getY(data[i - 1].value);

        // Control points ở giữa để làm phẳng đường cong
        double cpX = (prevX + x) / 2;
        path.cubicTo(cpX, prevY, cpX, y, x, y);
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}