import 'package:flutter/material.dart';
import 'package:flutter_app/MainPage.dart';
import 'package:flutter_app/utils/SharePreferenceUtils.dart';
import 'package:flutter_app/utils/TextUtils.dart';

void main() => runApp(SplashPage());

/*
 * @author jiangdongbo
 * 闪屏页
 */
class SplashPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashStatefulWidget(),
    );
  }
}

class SplashStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashHomeState();
  }
}

Image image;

class _SplashHomeState extends State<SplashStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: image,
    );
  }

  @override
  void initState() {
    super.initState();

    initSplash();
  }

  //倒计时
  void countDown() {
    Duration _duration = new Duration(seconds: 3);
    new Future.delayed(_duration, goToMainPage);
  }

  //页面跳转
  void goToMainPage() {
    runApp(MainPage());
  }

  //获取闪屏图
  void initSplash() {
    Future<String> splash = SharePreferenceUtils.getShowSplash();
    splash.then((String splash) {
      if (TextUtils.isEmpty(splash)) {
        goToMainPage();
        return;
      }

      image = new Image.asset("images/splash.jpg");

      countDown();
    });
  }
}
