
import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_util_code/utils.dart';
import 'package:get/get.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:lift_note/utils/index.dart';

import 'package:lift_note/extension/index.dart';

import 'package:lift_note/app/home/main/viewModel/home_view_model.dart';

import 'package:lift_note/routes/app_pages.dart';

class HomeController extends GetxController{

  HomeViewModel homeViewModel = HomeViewModel();

  final TextEditingController searchVC = TextEditingController();

  final ScrollController scrollController = ScrollController();

  final RefreshController refreshController = RefreshController(initialRefresh: false);

  StreamSubscription? _subscription;

  @override
  void onInit() async {
    super.onInit();

    buildNotification();

    scrollController.addListener((){
      if(scrollController.offset >= LScreenAdapter.kNavigationHeight()) {
        if(homeViewModel.isNoneColor) {
          return;
        }
        homeViewModel.isNoneColor = true;
        homeViewModel.barTintColor.value = 1;
      } else {
        if(!homeViewModel.isNoneColor) {
          return;
        }
        homeViewModel.isNoneColor = false;
        homeViewModel.barTintColor.value = 0;
      }
    });

    getNewsList(isLoadMore: false);

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    _subscription!.cancel();

    searchVC.dispose();
  }

  //MARK: 网络请求
  Future<void> getNewsList({required bool isLoadMore}) async {
    try {
      var res = await HomeViewModel.getNewsList();

      !isLoadMore ? homeViewModel.newsList.clear() : debugPrint('加载更多');
      homeViewModel.newsList.addAll(res);
      update();
      isLoadMore ? refreshController.loadComplete() : refreshController.refreshCompleted();
    } catch (err) { 
      refreshController.refreshCompleted();
      debugPrint('获取新闻列表失败: $err'); 
    }
  }

  //MARK: 业务逻辑点击
  void topCatecoryItemClick(int index) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.HOME_POKEDEX);
        break;
      default:
        debugPrint('点击了$index');
        break;
    }
  }

  void ToChatVC() async {
    //在这里弹框： --是发起方还是接收方？
    // String deviceId = await DeviceUtils.getDeviceId();
    String deviceId = '111';
    String connectId = deviceId + '123';
    Get.dialog(
      AlertDialog(
        title: const Text('请选择'),
        content: const Text('请选择您是发起方还是接收方'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              Get.toNamed(
                Routes.HOME_CHAT,
                arguments: {
                  'uid' : deviceId,
                  'to' : connectId
                }
              );
            },
            child: const Text('发起方'),
          ),
          TextButton(
           onPressed: () {
            
            Get.back();
            Get.toNamed(
              Routes.HOME_CHAT,
              arguments: {
                'uid' : connectId,
                'to' : deviceId
              }
            );
           },
           child: const Text('接收方'),
          )
        ]
      )
    );
    
  }

  //MARK: Notification
  buildNotification() {
    var eventBus = EventBus();
    _subscription = eventBus.on<LUpdateModel>((event) {
      final eventValue = event.eventName ?? '';
      if (eventValue != EventName.HomeChangeColor.name) {
        return;
      }
      int index = event.index!;
      String color = event.color!;
      homeViewModel.newsList[index].title = color;

      homeViewModel.newsList.refresh();
      
      debugPrint('改变了:$index的颜色:$color');
    });
  }
}
