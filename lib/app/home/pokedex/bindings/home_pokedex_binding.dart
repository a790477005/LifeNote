import 'package:get/get.dart';

import '../controller/home_pokedex_controller.dart';

class HomePokedexBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    
    Get.lazyPut<HomePokedexController>(
      () => HomePokedexController()
    );
  }
  
}