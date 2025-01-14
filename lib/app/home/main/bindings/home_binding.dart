import 'package:get/get.dart';

import 'package:lift_note/app/home/main/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    
    Get.lazyPut<HomeController>(
      () => HomeController()
    );
  }
  
}