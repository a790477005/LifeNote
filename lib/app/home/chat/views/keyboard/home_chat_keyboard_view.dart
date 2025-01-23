
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:lift_note/utils/index.dart';

import '../../../../../language/index.dart';

class HomeChatKeyboardView extends StatefulWidget{

  final void Function(String value) onSubmitted;

  void Function(bool isKeyboardVisible)? isKeyboardVisible;

  HomeChatKeyboardView({super.key, required this.onSubmitted, this.isKeyboardVisible});

  @override
  State<StatefulWidget> createState() => _HomeChatKeyboardViewState();

}

class _HomeChatKeyboardViewState extends State<HomeChatKeyboardView> {

  double _keyboardHeight = 0;

  double _contentHeight = LScreenAdapter.height(60 + 16);

  bool _isShowKeyboard = false;

  double _textValueHeight = LScreenAdapter.height(60);

  final _textController = TextEditingController();

  final keyboardController = KeyboardVisibilityController();

  @override
  void initState() {
    super.initState();
    keyboardController.onChange.listen((isKeyboardVisible) {
      widget.isKeyboardVisible?.call(isKeyboardVisible);
    });

    _textController.addListener(() {
      var value = _textController.text;

      double height = _calculateHeightByValue(value);

      setState(() {
        _textValueHeight = height;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return KeyboardVisibilityBuilder(builder: (context , isKeyboardVisible) {
      _keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
      _isShowKeyboard = isKeyboardVisible;
      _contentHeight = isKeyboardVisible
            ? _keyboardHeight + _textValueHeight
            : _textValueHeight ;
      return Container(
        height: _contentHeight,
        color: color_F1F1F1,
        padding: EdgeInsets.fromLTRB(LScreenAdapter.width(12), LScreenAdapter.height(8), LScreenAdapter.width(12), LScreenAdapter.height(8)),
        child: Column(
          children: [
            SizedBox(
              height: _textValueHeight - LScreenAdapter.height(16),
              width: LScreenAdapter.kscreenWidth() - LScreenAdapter.width(24),
              child: Row(
                children: [
                  SizedBox(
                    width: LScreenAdapter.kscreenWidth() - LScreenAdapter.width(24) - LScreenAdapter.width(70) - LScreenAdapter.width(16),
                    height: _textValueHeight - LScreenAdapter.height(16),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(LScreenAdapter.width(6), 0, 0, 0),
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: HomeChatShowKeys.chatHint.tr,
                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: LScreenAdapter.fontSize(14),
                            color: Colors.grey
                          ),
                        ),
                        style: TextStyle(
                            fontSize: LScreenAdapter.fontSize(14),
                            color: Colors.black
                          ),
                        cursorColor: Colors.grey,
                        maxLines: 5,
                        onSubmitted: (value) {
                          send(value);
                        },
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: LScreenAdapter.width(10),),
                      child: ElevatedButton(
                        onPressed: () {
                          send(_textController.text);
                        },
                        child: SizedBox(
                          width: LScreenAdapter.width(70),
                          height: LScreenAdapter.height(40),
                          child: Center(
                            child: Text(
                              LocalShowKeys.send.tr,
                              style: TextStyle(
                                fontSize: LScreenAdapter.fontSize(12),
                              ),
                            ),
                          ),
                        )
                      ),
                    )
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  void send(value) {
    _textController.clear();
    widget.onSubmitted(value);
  }

  double _calculateHeightByValue(String value) {
    final textSpan = TextSpan(
      text: value,
      style: const TextStyle(
        fontSize: 14,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      maxLines: 5,
      textDirection: TextDirection.ltr,
    )..layout(
      maxWidth: LScreenAdapter.kscreenWidth() - LScreenAdapter.width(24) - LScreenAdapter.width(70) - LScreenAdapter.width(16) - LScreenAdapter.width(12)
    );
    double valueContentHeight = textPainter.size.height;
    double valueHeight = valueContentHeight > 18 ? textPainter.size.height : 18;

    double lineDouble = (valueHeight / 18) > 0 ? (valueContentHeight / 18) : 1;
    int line = lineDouble.round();
    line = line > 5 ? 5  : line ;
    line++;
    
    double normalHeight = 18;
    double showHeight = line > 2 ? double.parse(line.toString()) * normalHeight : normalHeight * 2 + 5;
    return showHeight + LScreenAdapter.height(16);
  }
}