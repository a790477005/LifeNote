import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';
import '../../mine/controllers/mine_controller.dart';
import '../../note/controllers/note_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    
    Get.lazyPut<TabsController>(
      () => TabsController()
    );
    Get.lazyPut<NoteController>(
      () => NoteController(),
    );
    Get.lazyPut<MineController>(
      () => MineController(),
    );
  }
  
}