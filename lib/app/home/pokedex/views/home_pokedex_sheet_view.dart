import 'package:flutter/material.dart';
import 'package:lift_note/utils/Language.dart';
import 'package:lift_note/utils/index.dart';
import 'package:lift_note/extension/index.dart';
import 'package:lift_note/language/index.dart';

class HomePokedexGenerdationView extends StatelessWidget {
  const HomePokedexGenerdationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      width: LScreenAdapter.kscreenWidth(),
      height: LScreenAdapter.height(587),
      child: Column(
        children: [_createTitleContainer(), _createGridView()],
      ),
    );
  }

  //MARK: -- UI
  Widget _createTitleContainer() {
    return Padding(
      padding: EdgeInsets.only(top: LScreenAdapter.height(37)),
      child: const Center(
        child: Text(
          'Generation',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _createGridView() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            LScreenAdapter.width(26), LScreenAdapter.height(30), LScreenAdapter.width(26), 0),
        child: GridView.builder(
            itemCount: 5,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: LScreenAdapter.width(161),
                mainAxisSpacing: LScreenAdapter.width(7),
                childAspectRatio: 155 / 110),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(LScreenAdapter.width(3), LScreenAdapter.height(3), LScreenAdapter.width(3), LScreenAdapter.height(3)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: color_303943.withOpacity(0.1), // 阴影颜色和透明度
                        spreadRadius: 0, // 阴影扩散半径
                        blurRadius: 3, // 阴影模糊半径
                        offset: const Offset(0, 3), // 阴影偏移量
                      ),
                  ]),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          'Generation I',
                          style: TextStyle(fontSize: 14, color: color_303943),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
    ));
  }
}


//MARK: -- 键盘搜索
class HomePokedexSearchView extends StatefulWidget {

  final TextEditingController textEditingController;

  final void Function(String)? onSubmitted;

  const HomePokedexSearchView({
    super.key,
    required this.textEditingController,
    required this.onSubmitted
  });
  
  @override
  State<StatefulWidget> createState() => _HomePokedexSearchViewState();
}

class _HomePokedexSearchViewState extends State<HomePokedexSearchView> with WidgetsBindingObserver {
  
  final _focusNode = FocusNode();
  double _containerHeight = 100;
  double _keyboardHeight = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: LScreenAdapter.kscreenWidth(),
      height: LScreenAdapter.height(_containerHeight),
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
          left: LScreenAdapter.width(26),
          right: LScreenAdapter.width(26),
          top: LScreenAdapter.height(35),
          child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color_F1F1F1,
          ),
          height: LScreenAdapter.height(45),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: LScreenAdapter.width(20)),
                child: Image.asset(
                  ImageName.favourite_pokemon_png.img,
                  width: LScreenAdapter.width(23),
                  height: LScreenAdapter.height(28),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(LScreenAdapter.width(23), 0, LScreenAdapter.width(23), 0),
                  child: TextField(
                      onSubmitted: (value) => widget.onSubmitted,
                      controller: widget.textEditingController,
                      focusNode: _focusNode,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: HomeShowKeys.searchPlaceholder,
                        hintStyle: TextStyle(
                          color: color_303943.withOpacity(0.3),
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                )
              ),
            ],
          ),
        ),
        )],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.unfocus();
    _focusNode.dispose();
    widget.textEditingController.clear();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
          setState(() {
            _containerHeight = 100 + _keyboardHeight;
          });
        }
      });
    }
  }
}