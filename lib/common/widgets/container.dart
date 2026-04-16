import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class FullWidthContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? padding;

  const FullWidthContainer({
    super.key,
    required this.child,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? MediaQuery.of(context).size.width / 2,
      padding: (padding != null) ? EdgeInsets.all(padding!) : EdgeInsets.zero,
      child: child,
    );
  }
}

class HalfWidthContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? padding;

  const HalfWidthContainer({
    super.key,
    required this.child,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: height ?? MediaQuery.of(context).size.width / 2,
      padding: (padding != null) ? EdgeInsets.all(padding!) : EdgeInsets.zero,
      child: child,
    );
  }
}



