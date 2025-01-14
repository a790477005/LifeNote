
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controllers/note_controller.dart';
import '../../../utils/index.dart';

class NoteView extends GetView<NoteController> {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          _topWidget()
        ],
      ),
    );
  }

  ///MARK: 顶部组件
  Widget _topWidget() {
    return FutureBuilder(future: _getNavHeight(), builder: (context , snapshot) {
      return Positioned(
        top: 0,
        left: 0,
        right: 0,
        height: snapshot.data,
        child: Container(
          color: Colors.red,
      ));
    });
  }

  Future<double> _getNavHeight() async {
    bool isIOS = await Lsputil.isIosDevice();
    return isIOS ? LScreenAdapter.kStatusBarHeight() + LScreenAdapter.kNavigationHeight() : LScreenAdapter.kStatusBarHeight() + LScreenAdapter.kNavigationHeight() + LScreenAdapter.height(200);
  }
}