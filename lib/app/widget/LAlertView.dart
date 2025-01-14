
import 'package:flutter/material.dart';
import 'package:lift_note/utils/index.dart';

//不做详细内部布局封装 ---
class LAlertview extends Dialog {
  /*
  final String title;
  final Color titleColor;
  final double titleFontSize;

  final Widget content;

  final String cancelTitle;
  final String confirmTitle;
  final Color cancelBtnColor;
  final Color confirmBtnTextColor;
  */

  final EdgeInsets margin;

  final VoidCallback cancelBlock;
  final VoidCallback confirmBlock;


  LAlertview({
    super.key, 
    /*
    required this.title,
    required this.titleColor,
    required this.titleFontSize,

    required this.content,
    required this.cancelTitle,
    required this.confirmTitle, 
    required this.cancelBtnColor, 
    required this.confirmBtnTextColor,
    */
    required this.margin,
    required this.cancelBlock,
    required this.confirmBlock
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      color: Colors.blue,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                cancelBlock();
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.yellow,
                height: 80,
              ),
            )
          ),
           Expanded(
            child: InkWell(
              onTap: () {
                confirmBlock();
              },
              child: Container(
                height: 80,
                color: Colors.red,
              ),
            )
          )
        ],
      ),
    );
  }

}