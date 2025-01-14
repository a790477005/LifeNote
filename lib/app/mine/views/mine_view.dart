import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/mine_controller.dart';

class MineView extends GetView<MineController> {
  const MineView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: const Row(
        children: [
          Text('Mine')
        ],
      ),
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
      ),
    );
  }
  
}