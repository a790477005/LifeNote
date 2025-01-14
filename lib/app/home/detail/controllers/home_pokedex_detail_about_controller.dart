
import 'package:get/get.dart';


import './home_pokedex_detail_controller.dart';

import '../viewModel/home_pokedex_detail_about_view_model.dart';

class HomePokedexDetailAboutController extends GetxController{
  
  final HomePokedexDetailController parentController = Get.find<HomePokedexDetailController>();

  final HomePokedexDetailAboutViewModel viewModel = HomePokedexDetailAboutViewModel();

  @override
  void onInit() {
    super.onInit();

    viewModel.detailMsgModel = parentController.viewModel.detailMsgModel;
  }

}