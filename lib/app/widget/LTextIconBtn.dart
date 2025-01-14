import 'package:flutter/material.dart';
import 'package:lift_note/extension/index.dart';

enum LTextIconPosition { TextLeftIconRight, TextRightIconLeft }

class LTextIconBtn extends StatelessWidget {
  late final String text;
  late final double height;
  late final TextStyle textStyle;
  late final List<Color> backgroundColor;
  late final EdgeInsets padding;
  late final double spaceMargin;
  late final String iconName;
  late final double iconWidth;
  late final double iconHeight;
  late final LTextIconPosition position;

  late Alignment linearGradientAlignmentStart = Alignment.topLeft;
  late Alignment linearGradientAlignmentEnd = Alignment.bottomRight;
  late double? radius;
  late Color? borderColor;
  late double? borderWidth;
  late GestureTapCallback? onTap;

  LTextIconBtn(
      {super.key,
      required this.text,
      required this.height,
      required this.textStyle,
      required this.backgroundColor,
      required this.padding,
      required this.spaceMargin,
      required this.iconName,
      required this.iconWidth,
      required this.iconHeight,
      required this.position,
      this.radius,
      this.borderColor,
      this.borderWidth,
      this.onTap});

  @override
  Widget build(BuildContext context) {

    BoxDecoration boxDecoration;
    if (backgroundColor.length > 1) {
      boxDecoration = BoxDecoration(
        gradient: LinearGradient(
          begin: linearGradientAlignmentStart,
          end: linearGradientAlignmentEnd,
          colors: backgroundColor
        ),
        borderRadius: BorderRadius.circular(radius ?? 0),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 0
        )
      );
    } else {
      boxDecoration = BoxDecoration(
        color: backgroundColor.first,
        borderRadius: BorderRadius.circular(radius ?? 0),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 0
        )
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: boxDecoration,
        height: height,
        child: IntrinsicWidth(
            child: Padding(
            padding: padding,
            child: Row(
                children: [
                  position == LTextIconPosition.TextLeftIconRight
                      ? Text(text, style: textStyle)
                      : Image.asset(
                          iconName.img,
                          width: iconWidth,
                          height: iconHeight,
                        ),
                  SizedBox(
                    width: spaceMargin,
                  ),
                  position == LTextIconPosition.TextLeftIconRight
                      ? Image.asset(
                          iconName.img,
                          width: iconWidth,
                          height: iconHeight,
                        )
                      : Text(text, style: textStyle)
                ],
              ),
          )
        ),
      ),
    );
  }
}
