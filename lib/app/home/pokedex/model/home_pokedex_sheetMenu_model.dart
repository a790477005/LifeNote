
import 'package:lift_note/utils/index.dart';
import 'package:lift_note/language/index.dart';

class HomePokedexSheetmenuModel {
  late final String title;
  late final String imageName;

  HomePokedexSheetmenuModel(this.title, this.imageName);

  static List<HomePokedexSheetmenuModel> createBottomSheetMenuList() {
    return [
      HomePokedexSheetmenuModel(HomePokedexShowKeys.favouritePokemon, ImageName.favourite_pokemon_png),
      HomePokedexSheetmenuModel(HomePokedexShowKeys.allType, ImageName.pokedex_ball_png),
      HomePokedexSheetmenuModel(HomePokedexShowKeys.allGen, ImageName.pokedex_ball_png),
      HomePokedexSheetmenuModel(LocalShowKeys.search, ImageName.favourite_pokemon_png),
    ];
  }
}