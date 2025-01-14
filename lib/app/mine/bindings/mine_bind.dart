import 'package:get/get.dart';

import '../controllers/mine_controller.dart';

class MineBind extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    
    Get.lazyPut<MineController>(
      () => MineController()
    );
  }
  
}