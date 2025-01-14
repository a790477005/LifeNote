
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lift_note/app/home/main/model/index.dart';

import 'package:lift_note/http/index.dart';

class HomeViewModel {

  List<HomeCategoryItemModel> categoryItemList = HomeCategoryItemModel.createHomeCategoryItemList();

  RxList newsList = [].obs;

  bool isNoneColor = true;
  RxDouble barTintColor = 0.0.obs;

  static Future<List<HomeNewsListModelEntity>> getNewsList() async {
    try {
      List res = await Request.get(Api.getPokemonNewsList);
      List<HomeNewsListModelEntity> newsList = res.map((item) => HomeNewsListModelEntity.fromJson(item)).toList();
      return newsList;
    } catch (e) {
      return Future.error(e);
    }
  }

}