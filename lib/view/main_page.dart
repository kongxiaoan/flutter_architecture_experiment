import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_experiment/controller/main_page_controller.dart';
import 'package:flutter_architecture_experiment/model/main_page_entity.dart';
import 'package:flutter_architecture_experiment/view/home_page.dart';
import 'package:flutter_architecture_experiment/view/list_page.dart';
import 'package:flutter_architecture_experiment/view/message_page.dart';

class MainPage extends MvcBaseView<MainPageController> {
  MainPage({super.key});

  @override
  MainPageController createController() => MainPageController();

  @override
  MvcBaseState<MvcBaseModel, StatefulWidget> create() => _MainPageState();
}

class _MainPageState extends MvcBaseState<MainPageEntity, MainPage> {
  var _position = 0;
  final _ctrl = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _ctrl,
        children: _buildPages(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black45,
          backgroundColor: Colors.white,
          selectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 14,
          items: _buildBottomItems(),
          currentIndex: _position,
          onTap: _onTapBottomItem),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  void observer(MainPageEntity event) {}

  /**
   * 切换pageView&更新索引
   */
  void _onTapBottomItem(position) {
    _ctrl.jumpToPage(position);

    setState(() {
      _position = position;
    });
  }

  List<BottomNavigationBarItem> _buildBottomItems() {
    List<BottomNavigationBarItem> list = [];
    widget.controller.model.bottomNavMap.forEach((key, value) {
      list.add(BottomNavigationBarItem(
          label: key,
          backgroundColor: Colors.transparent,
          activeIcon: Image.asset(
            'assets/images/active_$value',
            width: 25,
            height: 25,
          ),
          icon: Image.asset(
            'assets/images/$value',
            width: 25,
            height: 25,
          )));
    });
    return list;
  }

  List<Widget> _buildPages() => <Widget>[HomePage(), ListPage(), MessagePage()];
}
