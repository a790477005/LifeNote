
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import './LSputil.dart';
import './LKeyChain.dart';

class Language {

  const Language._();

  static const String CN = 'zh';

  static const String EN = 'en';

  static Locale? getLocale() {
    String language = Lsputil.getString(LKeychain.language) == null ? Get.deviceLocale!.languageCode : Lsputil.getString(LKeychain.language)!;
    
    switch (language) {
      case 'zh':
        return const Locale('zh', 'CN');
      case 'en':
        return const Locale('en', 'US');
      default:
        Lsputil.setString(LKeychain.language, Get.deviceLocale!.languageCode);
        return const Locale('zh', 'CN');
    }
  }

}