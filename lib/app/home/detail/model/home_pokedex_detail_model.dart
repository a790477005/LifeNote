import 'dart:convert';

import 'package:get/get.dart';
import 'package:lift_note/app/home/detail/controllers/home_pokedex_detail_controller.dart';
import 'package:lift_note/language/index.dart';

import './home_pokedex_detail_title_model.dart';

class HomePokedexDetailModel {

  static String _getTitleList() {
    String about = HomePokedexDetailShowKeys.about.tr;
    String baseStats = HomePokedexDetailShowKeys.baseStats.tr;
    String evolution = HomePokedexDetailShowKeys.evolution.tr;
    String movies = HomePokedexDetailShowKeys.movies.tr;
    return '''
    [
      {
        "title": "$about",
        "isSelected": true
      },
      {
        "title": "$baseStats",
        "isSelected": false
      },
      {
        "title": "$evolution",
        "isSelected": false
      },
      {
        "title": "$movies",
        "isSelected": false
      }
    ]
    ''';
  }

  static List<HomePokedexDetailTitleModel> getTitleModelList() {
    String arrJsonStr = HomePokedexDetailModel._getTitleList();
    List<dynamic> jsonList = json.decode(arrJsonStr);
    List<HomePokedexDetailTitleModel> modelList = getHomePokedexDetailTitleModelList(jsonList);
    return modelList;
  }
}

