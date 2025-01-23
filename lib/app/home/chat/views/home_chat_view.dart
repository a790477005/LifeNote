import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './keyboard/index.dart';
import '../controllers/home_chat_controller.dart';


class HomeChatView extends GetView<HomeChatController> {
  const HomeChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('HomeChatView'),
      ),
      body: SafeArea(
        bottom: true,
        child: NotificationListener(
          onNotification: (notification) {
            if (notification is UserScrollNotification) {
              debugPrint('关闭键盘');
              FocusScope.of(context).unfocus();
            }
            return false;
          },
          child: Obx(
            () => ListView.builder(
              shrinkWrap: true,
              reverse: true,
              physics: const BouncingScrollPhysics(),
              controller: controller.scrollController,
              itemCount: controller.homeChatViewModel.chatList.length,
              itemBuilder: (context , index) {
                return Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(controller.homeChatViewModel.chatList[index].content + '角色:' + controller.homeChatViewModel.chatList[index].role.toString()),
                );
              }
            )
          )
        ),
      ),
      bottomNavigationBar: HomeChatKeyboardView(
        onSubmitted: (value) {
          if (value.isEmpty) {
            return;
          }
          controller.addOtherMsg(0, value);
        },
        isKeyboardVisible: (isKeyboardVisible) {
          isKeyboardVisible ? controller.scrollToEnd() : null;
        },
      ),
    );
  }
  
}