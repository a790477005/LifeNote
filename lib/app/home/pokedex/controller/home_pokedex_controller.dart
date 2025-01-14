
import 'package:flutter/material.dart';
import 'package:flutter_util_code/utils.dart';
import 'package:get/get.dart';

import 'package:lift_note/routes/app_pages.dart';
import 'package:lift_note/extension/index.dart';
import 'package:lift_note/utils/index.dart';

import '../viewModel/home_pokedex_view_model.dart';

class HomePokedexController extends GetxController {

  final viewModel = HomePokedexViewModel();

  final searchInputController = TextEditingController();

  bool _isNoMore = false;

  final size = 10;

  @override
  void onInit() async{
    super.onInit();

    getPokedexList(isLoadMore: false);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    searchInputController.dispose();
  }

  //MARK: 网络请求数据
  Future<bool> getPokedexList({required bool isLoadMore}) async {
    try {
      _isNoMore = isLoadMore ? _isNoMore : false;

      if (isLoadMore && _isNoMore) {
        update();
        return _isNoMore;
      }
      isLoadMore ? viewModel.page++ : viewModel.page = 1;
      var res = await HomePokedexViewModel.getPokedexList(viewModel.page);
      isLoadMore ? debugPrint('加载更多') : viewModel.pokedexList.clear();
      viewModel.pokedexList.addAll(res);
      if (isLoadMore) {
        _isNoMore = res.length < size; 
      }
      update();
      return _isNoMore;
    }catch(e) {
      isLoadMore ? viewModel.page-- : viewModel.page = 1;
      return _isNoMore;
    }
  }

  //MARK: 逻辑点击
  void back() {
    Get.back();
  }

  void controlOptionShow(bool isShow) {
    viewModel.isShowOption.value = isShow;
    update();
  }

  void clickIndexItem(int index) {
    Get.toNamed(Routes.HOME_POKEDEX_DETAIL, arguments: {"index" : index});
  }

  void moreClick() {
    var eventBus = EventBus();

    eventBus.fire(LUpdateModel(eventName: EventName.HomeChangeColor.name , color: '0xFF3E8570' , index: 0));
  }
}