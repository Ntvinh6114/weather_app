import 'package:flutter/material.dart';

// class ContentBox extends StatelessWidget {
//   final Widget? title;
//   final Widget? body;
//   final Widget? footer;
//   final double spacing;
//
//   const ContentBox({
//     super.key,
//     this.title,
//     this.body,
//     this.footer,
//     this.spacing = 10.0,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         if (title != null) ...[
//           title!,
//           SizedBox(height: spacing),
//         ],
//
//         if (body != null)
//           Expanded(
//             child: body!,
//           )
//         else
//           const Spacer(),
//
//         if (footer != null) ...[
//           SizedBox(height: spacing),
//           footer!,
//         ],
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class ContentBox extends StatelessWidget {
  final Widget? title;
  final Widget? body;
  final Widget? footer;
  final List<Widget>? deco; // Danh sách các Positioned widget
  final double spacing;

  const ContentBox({
    super.key,
    this.title,
    this.body,
    this.footer,
    this.deco, // Nhận vào một List các Widget (thường là Positioned)
    this.spacing = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [

        if (deco != null) ...deco!,

        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (title != null) ...[
              title!,
              SizedBox(height: spacing),
            ],
            if (body != null)
              Expanded(child: body!)
            else
              const Spacer(),
            if (footer != null) ...[
              SizedBox(height: spacing),
              footer!,
            ],
          ],
        ),
      ],
    );
  }
}
