
import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lift_note/utils/index.dart';
import '../model/index.dart';
import '../views/index.dart';
import '../viewModel/home_pokedex_detail_view_model.dart';

class HomePokedexDetailController extends GetxController {

  final ScrollController scrollController = ScrollController();

  final PageController pageController = PageController(keepPage: true);

  final HomePokedexDetailViewModel viewModel = HomePokedexDetailViewModel();

  final List<Widget> pages = [
    const HomePokedexDetailAboutView(),
    HomePokedexDetailBasestatsView()
  ];

  RxBool isWhite = true.obs;

  @override
  void onInit() async{
    super.onInit();

    scrollController.addListener(
      () {
        bool result = scrollController.offset < LScreenAdapter.height(32);

        if(scrollController.offset > LScreenAdapter.height(40)) {
          return;
        }
        
        if(result == isWhite.value) {
          return;
        }

        isWhite.value = result;
      }
    );

    viewModel.getTitleList();
    // /* 有序
    final result = await compute(getMsg , 'ddd');
    viewModel.detailMsgModel.value = result['detail'];
    viewModel.evolutionList.value = result['evolution'];

    /**
     * 无序
     */

    /*
    final result = await Future.wait(
      [
        HomePokedexDetailViewModel.getDetailMsg(),
        HomePokedexDetailViewModel.getEvolutionList()
      ]
    );
    viewModel.detailMsgModel.value = result[0] as HomePokedexDetailMsgModel;
    viewModel.evolutionList.value = result[1] as HomePokedexDetailEvolutionModel;
    */

    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    scrollController.dispose();
    pageController.dispose();
  }

  void selectedIndexPage(int index) {
    viewModel.titleList.asMap().forEach((indexItem, item) {
      indexItem == index ? item.isSelected = true : item.isSelected = false;
    });
    viewModel.titleList.refresh();

    pageController.jumpToPage(index);
   
  }

  //MARK: -- 此处是为了调试AlertDialog可能存在的业务场景
  void cancel() async{
    await HomePokedexDetailViewModel.getDetailMsg();
  }

  void changedAlertMargin() {
    viewModel.dialogMargin.value = const EdgeInsets.fromLTRB(50, 50, 50, 50);

    update();
  }

  Future<Map<String, dynamic>> getMsg(detail) async{
    debugPrint(detail);
    try {
      debugPrint('---------获取详情开始');
      HomePokedexDetailMsgModel detailModel = await HomePokedexDetailViewModel.getDetailMsg();

      String msg = '------------获取数据开始';
      debugPrint(msg);
      HomePokedexDetailEvolutionModel evolutionModel = await HomePokedexDetailViewModel.getEvolutionList();

      return {
        'detail' : detailModel ,
        'evolution' : evolutionModel
      };
    } catch (e){
      return {
        'detail' : null ,
        'evolution' : null
      };
    }
  }
}