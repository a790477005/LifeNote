
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lift_note/app/home/chat/viewModel/home_chat_view_model.dart';
import 'package:lift_note/http/index.dart';


import '../model/home_chat_model.dart';

class HomeChatController extends GetxController{

  final HomeChatViewModel homeChatViewModel = HomeChatViewModel();

  final ScrollController scrollController = ScrollController();

  late String _uid;
  late String _toUid;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    scrollController.dispose();

    LWebSocketUtil().closeSocket();
  }

  @override
  void onInit() async{
    super.onInit();

    _configParams();

    scrollController.addListener( () {

    });
    
   _configConnectSetting();
  }

  //MARK: 逻辑
  void addOtherMsg(role , value) {
    var sendJson = HomeChatViewModel.createSendModel(
      value: value,
      uid: _uid,
      toUid: _toUid,
      action: HomeChatAction.chat.value
    );

    LWebSocketUtil().sendMessage(
      sendJson,
      success: () {
        _insetMsg(role: 0, value: value);
      },
      fail: (e) {
        debugPrint('$e');
      }
    );
  }

  void _insetMsg({required int role , required String value}) {
    homeChatViewModel.chatList.insert(0, HomeChatModel(
      content: value,
      role: role
    ));
    scrollToEnd();

    refresh();
  }

  void _configParams() {
    dynamic args = Get.arguments;

    _uid = args['uid'];

    _toUid = args['to'];
  }

  void scrollToEnd() {
    scrollController.jumpTo(0.0);
  }

  //MARK: create connect message
  void _configConnectSetting () {
  
    LWebSocketUtil().initWebSocket(
      uid: _uid,
      onOpen: () {
        debugPrint('连接成功');
        LWebSocketUtil().initHeartBeat();
      },
      onError: (err) {
        debugPrint('连接失败$err');
      },
      onMessage: (message) {
        debugPrint('$message 获取？');

        String? msg = HomeChatViewModel.handleActionValue(message);
        if (msg != null && msg != '') {
          _insetMsg(role: 0, value: msg);
        }
      }
    );
  }
}