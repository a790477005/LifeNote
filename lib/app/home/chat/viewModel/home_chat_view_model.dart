import 'package:get/get.dart';
import 'dart:convert';

import '../model/home_chat_model.dart';

class HomeChatViewModel {
  
  RxList chatList = <HomeChatModel>[].obs;

  static String? handleActionValue(message) {
    Map<String, dynamic> map = json.decode(message);
          
    var model = HomeChatBaseModel.fromJson(map);

    var actionValue = model.action;

    if (actionValue == HomeChatAction.chat.value) {
      return model.data?.msg;
    } else {
      return null;
    }
  }

  static createSendModel({required String value , required String action , required String uid , required String toUid}) {
    return jsonEncode(HomeChatBaseModel(
      action: action,
      data: Data(
        msg: value,
        action : action
      ),
      from: uid,
      connectUid: toUid
    ).toJson());
  }
}