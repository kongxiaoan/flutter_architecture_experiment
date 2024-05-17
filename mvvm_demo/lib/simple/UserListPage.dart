import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_demo/base/BaseRepository.dart';
import 'package:mvvm_demo/base/BaseState.dart';
import 'package:mvvm_demo/base/BaseStatefulWidget.dart';
import 'package:mvvm_demo/base/BaseViewModel.dart';
import 'package:mvvm_demo/simple/UserListRepository.dart';

import 'UserListViewModel.dart';

class UserListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserListState();
}

class _UserListState extends BaseState<UserListPage, UserListViewModel> {

  @override
  void initState() {
    super.initState();
    viewModel.controller.stream.listen((event) {

    });
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewModel.getUserLists(),
      builder: ,
    );
  }
}
