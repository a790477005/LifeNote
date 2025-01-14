
import 'package:get/get.dart';
import 'package:lift_note/http/index.dart';

import '../model/index.dart';

class HomePokedexViewModel {
  RxList<HomePokedexModel> pokedexList = <HomePokedexModel>[].obs;

  int page = 1;

  RxBool isShowOption = false.obs;

  List<HomePokedexSheetmenuModel> menuModelList = HomePokedexSheetmenuModel.createBottomSheetMenuList();

  static Future<List<HomePokedexModel>> getPokedexList(int page) async {
    try {
      List res = await Request.post(
        Api.getPokemonList, 
        data: {
          "page": page,
        }
      );

      List<HomePokedexModel> pokedexList = res.map((item) => HomePokedexModel.fromJson(item)).toList();
      return pokedexList;
    } catch (e) {
      return Future.error(e);
    }
  }
}