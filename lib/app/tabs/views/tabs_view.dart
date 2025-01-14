
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lift_note/app/tabs/controllers/tabs_controller.dart';

import '../../../language/local.dart';

class TabsView extends GetView<TabsController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx( () => Scaffold(
      body: PageView(
        controller: controller.pageController,
        children: controller.pages,
        onPageChanged: (index) {
          controller.setCurrentIndex(index);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        
        currentIndex: controller.currentIndex.value,

        onTap: (index) {
          controller.setCurrentIndex(index);
          controller.pageController.jumpToPage(index);
        },

        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.category), label: LocalShowKeys.note.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.people), label: LocalShowKeys.mine.tr),
        ],
      ),
    ) );
  }
  
}