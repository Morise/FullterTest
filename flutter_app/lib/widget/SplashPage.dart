import 'package:flutter/material.dart';
import 'package:flutter_app/MainPage.dart';
import 'package:flutter_app/utils/SharePreferenceUtils.dart';
import 'package:flutter_app/utils/TextUtils.dart';

void main()=> runApp(SplashPage());
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

class SplashStatefulWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SplashHomeState();
  }
}

Image image;
class _SplashHomeState extends State<SplashStatefulWidget>{

  @override
  Widget build(BuildContext context) {
    image = new Image(
      color: Colors.transparent,
    );
    return image;
  }

  @override
  void initState() {
    super.initState();

    if(!initSplash()){
      goToMainPage();
    }
  }

  //倒计时
  void countDown(){
    Duration _duration = new Duration(seconds: 3);
    new Future.delayed(_duration,goToMainPage);
  }

  //页面跳转
  void goToMainPage(){
    runApp(MainPage());
  }

  //获取闪屏图
  bool initSplash(){
    String splash = SharePreferenceUtils.getShowSplash();
    if(TextUtils.isEmpty(splash)){
      return false;
    }

    return false;
  }
}

