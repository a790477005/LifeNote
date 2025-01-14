import 'package:flutter/material.dart';

//这里记录一下基本的自定义StatefulWidget
typedef BoolBlock = Function(bool value);

class LServiceView extends StatefulWidget {

  final BoolBlock? resultBlock;

  const LServiceView({super.key, this.resultBlock});

  @override
  State<StatefulWidget> createState() => _LServiceViewState();
}

class _LServiceViewState extends State<LServiceView> {
  double _width = 0;

  bool _isSelected = false;

  @override
  void initState() {
    super.initState();

    _width = _isSelected ? 100 : 150;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
          children: [
            InkWell(
              child: Container(
                width: _width,
                color: Colors.red,
              ),
              onTap: () {
                setState(() {
                  _isSelected = !_isSelected;

                  _width = _isSelected ? 100 : 150;

                  widget.resultBlock == null ? debugPrint('') : widget.resultBlock!(_isSelected);
                });
              },
            ),

            Expanded(
              child: Container(
                color: Colors.blue,
              )
            )
          ],
        )
    );
  }
}
