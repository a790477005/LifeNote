import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LScreenAdapter {
  static width(num v) {
    return v.w;
  }

  static kStatusBarHeight() {
    return ScreenUtil().statusBarHeight;
  }

  static kBottomBarHeight () {
    return ScreenUtil().bottomBarHeight;
  }

  static kNavigationHeight() {
    // return Platform.isIOS ? 44.h + AppBar().preferredSize.height : AppBar().preferredSize.height;
    return AppBar().preferredSize.height + ScreenUtil().statusBarHeight;
  }

  static height(num v) {
    return v.h;
  }

  static fontSize(num v) {
    return v.sp;
  }

  static kscreenWidth() {
    return 1.sw;
  }

  static kscreenHeight() {
    return 1.sh;
  }
}