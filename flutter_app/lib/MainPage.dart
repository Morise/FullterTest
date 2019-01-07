import 'package:flutter/material.dart';
import 'package:flutter_app/widget/MainTab1.dart';
import 'package:flutter_app/widget/MainTab2.dart';
import 'package:flutter_app/widget/MainTab3.dart';
import 'package:flutter_app/widget/MainTab4.dart';
import 'package:flutter_app/widget/MainTab5.dart';

class MainPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tabIndex = 0;
  var tabImages;
  var appBarTitles = ['首页', '商铺', '排行', '消息', '我的'];

  /*
   * 根据image路径获取图片
   * 这个图片的路径需要在 pubspec.yaml 中去定义
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  /*
   * 根据索引获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(color: const Color(0xff63ca6c)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(color: const Color(0xff888888)));
    }
  }

  /*
   * 存储的四个页面，和Fragment一样
   */
  var _bodys;

  void initData() {
    /*
      bottom的按压图片
     */
    tabImages = [
      [
        getTabImage('images/icon_home_72_gray.png'),
        getTabImage('images/icon_home_72_green.png')
      ],
      [
        getTabImage('images/icon_youxiquan_72_gray.png'),
        getTabImage('images/icon_youxiquan_72_green.png')
      ],
      [
        getTabImage('images/icon_rank_gray.png'),
        getTabImage('images/icon_rank_green.png')
      ],
      [
        getTabImage('images/icon_kandian_72_gray.png'),
        getTabImage('images/icon_kandian_72_green.png')
      ],
      [
        getTabImage('images/icon_me_72_gray.png'),
        getTabImage('images/icon_me_72_green.png')
      ]
    ];

    _bodys = [
      new MainTab1(),
      new MainTab2(),
      new MainTab3(),
      new MainTab4(),
      new MainTab5()
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      body: _bodys[_tabIndex],
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: getTabIcon(0), title: getTabTitle(0)),
          new BottomNavigationBarItem(
              icon: getTabIcon(1), title: getTabTitle(1)),
          new BottomNavigationBarItem(
              icon: getTabIcon(2), title: getTabTitle(2)),
          new BottomNavigationBarItem(
              icon: getTabIcon(3), title: getTabTitle(3)),
          new BottomNavigationBarItem(
              icon: getTabIcon(4), title: getTabTitle(4)),
        ],
        //设置显示的模式
        type: BottomNavigationBarType.fixed,
        //设置当前的索引
        currentIndex: _tabIndex,
        //tabBottom的点击监听
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}
