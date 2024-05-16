import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_experiment/controller/home_page_controller.dart';
import 'package:flutter_architecture_experiment/model/home_page_entity.dart';

import 'home/discover_page.dart';

class HomePage extends MvcBaseView<HomePageController> {
  HomePage({super.key});

  @override
  MvcBaseState<MvcBaseModel, StatefulWidget> create() => _HomePageState();

  @override
  HomePageController createController() => HomePageController();
}

class _HomePageState extends MvcBaseState<HomePageEntity, HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: _buildPages().length,
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                toolbarHeight: 0,
                elevation: 0,
                backgroundColor: Colors.transparent,
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(48),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Positioned(child: _buildHomeTabBar()),
                          Positioned(
                              right: 15,
                              child: IconButton(
                                  alignment: Alignment.centerRight,
                                  color: Colors.white,
                                  onPressed: () {},
                                  icon: const Icon(Icons.search_rounded)))
                        ],
                      ),
                    )),
              ),
              body: TabBarView(
                children: _buildPages(),
              ),
            )));
  }

  @override
  void observer(HomePageEntity event) {}

  PreferredSizeWidget _buildHomeTabBar() {
    return const TabBar(
      labelStyle: TextStyle(fontSize: 18),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white,
      indicatorColor: Colors.white,
      dividerHeight: 0,
      tabAlignment: TabAlignment.center,
      tabs: [Tab(text: '发现'), Tab(text: '首页'), Tab(text: '关注')],
    );
  }

  List<Widget> _buildPages() =>
      <Widget>[DiscoverPage(), DiscoverPage(), DiscoverPage()];
}
