import 'package:flutter/material.dart';
import 'myHomePageWidget.dart' as myNewHomepage;
import 'homePageWidget.dart' as home;
import 'find.dart' as find;

class MainPage extends StatefulWidget{
  @override
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage>{
  int tabIndex = 0;
  var tabImages;
  var appBarTitles = ['首页','发现','我的'];
  var pageList;

  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }

Image getTabIcon(int curIndex) {
    if (curIndex == tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }
  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff1296db)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff515151)));
    }
  }


  void initData(){
    tabImages = [
      [getTabImage('lib/source/icon/home_normal.png'),getTabImage('lib/source/icon/home_select.png')],
      [getTabImage('lib/source/icon/find_normal.png'),getTabImage('lib/source/icon/find_select.png')],
      [getTabImage('lib/source/icon/my_normal.png'),getTabImage('lib/source/icon/my_select.png')],

    ];

    pageList = [
      home.homeWidget(),
      find.findWidget(),
      myNewHomepage.myHomeWidget(title:'我的页面'),
    ];
  }
  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      body:pageList[tabIndex],
      bottomNavigationBar:new BottomNavigationBar(
        items:<BottomNavigationBarItem>[
           new BottomNavigationBarItem(
                icon: getTabIcon(0), title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(1), title: getTabTitle(1)),
            new BottomNavigationBarItem(
                icon: getTabIcon(2), title: getTabTitle(2)),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: tabIndex,
        iconSize:24,
        onTap:(index){
          setState(() {
            tabIndex = index;
          });
        }
      ),
    );
  }
}