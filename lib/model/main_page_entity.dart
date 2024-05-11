import 'dart:collection';
import 'dart:ffi';

import 'package:base/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPageEntity extends MvcBaseModel {
  Map<String, String> bottomNavMap = {
    "首页": "main_home.png",
    "社区": "main_community.png",
    "通知": "main_notify.png",
    "我的": "main_user.png"
  };

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
