import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_experiment/controller/main_page_controller.dart';
import 'package:flutter_architecture_experiment/controller/splash_page_controller.dart';
import 'package:flutter_architecture_experiment/model/splash_page_entity.dart';
import 'package:flutter_architecture_experiment/view/main_page.dart';

class SplashPage extends MvcBaseView<SplashPageController> {
  @override
  SplashPageController createController() => SplashPageController();

  @override
  MvcBaseState<MvcBaseModel, StatefulWidget> create() => _SplashPageState();
}

class _SplashPageState extends MvcBaseState<SplashPageEntity, SplashPage> {
  double _currentProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: Container(
        child: Image.asset('assets/images/splash_start.jpg'),
      ),
      // child: Stack(
      //   alignment: Alignment.center,
      //   children: [
      //     Positioned(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           Image.asset(
      //             'assets/images/main_notify.png',
      //             width: 50,
      //             height: 40,
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           const Text(
      //             '资源加载中...',
      //             style: TextStyle(
      //               fontSize: 12,
      //               color: Colors.white,
      //               decoration: TextDecoration.none,
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 50,
      //       left: 50,
      //       right: 50,
      //       child: LinearProgressIndicator(
      //         backgroundColor: Colors.grey[800],
      //         valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      //         value: _currentProgress,
      //       ),
      //     )
      //   ],
      // ),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.controller.startInit();
  }



  @override
  void observer(SplashPageEntity event) {
    _currentProgress = (event.initProgress / 100.0);
    print("update progress $_currentProgress");
    if (_currentProgress == 1.0) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MainPage();
      }));
    }
  }
}
