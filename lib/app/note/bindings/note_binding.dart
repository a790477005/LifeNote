import 'package:get/get.dart';

import '../controllers/note_controller.dart';

class NoteBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    
    Get.lazyPut<NoteController>(
      () => NoteController()
    );
  }
  
}