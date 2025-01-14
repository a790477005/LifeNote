
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './routes/app_pages.dart';
import './language/index.dart';
import './utils/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //flutter 修改状态栏的颜色
  SystemUiOverlayStyle systemUiOverlayStyle =
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  await Lsputil.getInstance();

  runApp(
      //填入设计稿中设备的屏幕尺寸,单位dp
      ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return GetMaterialApp(
              theme: ThemeData(primarySwatch: Colors.grey),
              defaultTransition: Transition.rightToLeft,
              title: LocalShowKeys.application.tr,
              initialRoute: isHasToken() ? AppPages.HOME : AppPages.LOGIN,
              getPages: AppPages.routes,
              translations: Message(),
              locale: Language.getLocale(),
              fallbackLocale: const Locale("zh", "CN"),
              builder: EasyLoading.init(),
            );
          }));
}

//MARK: 判断是否存在token
bool isHasToken() {
  return Lsputil.getString(LKeychain.token) != null;
}
