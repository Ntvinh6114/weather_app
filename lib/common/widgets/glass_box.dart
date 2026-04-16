import 'dart:ui';
import 'package:flutter/material.dart';

class GlassBox extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final double borderRadius;
  final bool overflow;
  final Color color;

  const GlassBox({
    super.key,
    required this.child,
    this.blur = 10.0,
    this.opacity = 0.15,
    this.borderRadius = 20.0,
    this.overflow = false,
    this.color = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: (!overflow) ? EdgeInsets.all(borderRadius / 2) : null,
          decoration: BoxDecoration(
            color: color.withOpacity(opacity),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: color.withOpacity(0.2),
              width: 1.5,
            )
          ),
          child: child,
        ),
      ),
    );
  }
}