import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../note/views/note_view.dart';
import '../../mine/views/mine_view.dart';


class TabsController extends GetxController {
  RxInt currentIndex = 0.obs;

  PageController pageController = Get.arguments == null ? PageController(initialPage: 0) : PageController(initialPage: Get.arguments["initialPage"] );

  final List<Widget> pages = [
    const NoteView(),
    const MineView()
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    
    if (Get.arguments != null) {
      currentIndex.value = Get.arguments["initialPage"];
      pageController =
          PageController(initialPage: Get.arguments["initialPage"]);
    }
  }
  
  void setCurrentIndex(index) {
    currentIndex.value = index;
  }
}