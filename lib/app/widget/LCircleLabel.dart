import 'package:flutter/material.dart';

class Lcirclelabel extends StatelessWidget {
  late final String text;
  late final TextStyle textStyle;
  late final Color color;
  late final EdgeInsets padding;

  late double? radius;
  late Color? borderColor;
  late double? borderWidth;
  late GestureTapCallback? onTap;

  Lcirclelabel(
      {super.key,
      required this.text,
      required this.textStyle,
      required this.color,
      required this.radius,
      required this.padding,
      this.borderColor,
      this.borderWidth,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(radius ?? 0.0),
              border: Border.all(
                  color: borderColor ?? Colors.white,
                  width: borderWidth ?? 0.0),
            ),
            child: Center(child: Text(text, style: textStyle))),
      ),
    );
  }
}
