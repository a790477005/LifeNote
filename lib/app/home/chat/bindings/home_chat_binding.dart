import 'package:get/get.dart';

import '../controllers/home_chat_controller.dart';

class HomeChatBinding extends Bindings {
  @override
  void dependencies() {
    
    Get.lazyPut<HomeChatController>(
      () => HomeChatController()
    );
  }
  
}