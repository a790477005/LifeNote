

import 'package:get/get.dart';

import '../controllers/index.dart';


class HomePokedexDetailBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    
    Get.lazyPut<HomePokedexDetailController>(
      () => HomePokedexDetailController()
    );

    Get.lazyPut<HomePokedexDetailBasestatsController>(
      () => HomePokedexDetailBasestatsController()
    );

    Get.lazyPut<HomePokedexDetailAboutController>(
      () => HomePokedexDetailAboutController()
    );
  }
  
}