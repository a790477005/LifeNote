
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift_note/http/index.dart';

import '../model/index.dart';

class HomePokedexDetailViewModel {

  RxList titleList = [].obs;

  Rx<HomePokedexDetailMsgModel> detailMsgModel = HomePokedexDetailMsgModel.fromJson({}).obs;

  Rx<HomePokedexDetailEvolutionModel> evolutionList = HomePokedexDetailEvolutionModel.fromJson({}).obs;

  Rx<EdgeInsets> dialogMargin = const EdgeInsets.fromLTRB(30, 100, 30, 100).obs;

  void getTitleList() {
    titleList = HomePokedexDetailModel.getTitleModelList().obs;
  }

  static Future<HomePokedexDetailMsgModel> getDetailMsg() async {
    try {
      var res = await Request.get(
        Api.getPokemonDetail, 
      );

      HomePokedexDetailMsgModel model = HomePokedexDetailMsgModel.fromJson(res);
      return model;
    }catch(e) {
      return Future.error(e);
    }
  }

  static Future<HomePokedexDetailEvolutionModel> getEvolutionList() async {

    try {
      var res = await Request.get(
        Api.getPokemonEvolutions, 
      );

      debugPrint(res.toString() + '90999');

      HomePokedexDetailEvolutionModel model = HomePokedexDetailEvolutionModel.fromJson(res);

      return model;
    }catch(e) {
      return Future.error(e);
    }
  }
}