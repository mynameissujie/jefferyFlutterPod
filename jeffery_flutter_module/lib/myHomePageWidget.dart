import 'package:flutter/material.dart';
import 'getoff.dart' as getoff;

class  myHomeWidget  extends StatefulWidget{
  final String title;
  myHomeWidget({Key key,this.title}) :super(key:key);

  @override
  myHomeState createState() => myHomeState();
  
}
class myHomeState extends State<myHomeWidget> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
        leading: Offstage(
          offstage: false,
          child: new IconButton(
            tooltip: 'Previous choice',
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
        actions:<Widget>[
          new IconButton(
            icon:Icon(Icons.search),
            tooltip: '搜索',
            onPressed:(){
            },
          ),
          new IconButton(
            // icon:ImageIcon(AssetImage('lib/source/icon/app-logo-80.png')),//加载纯色的背景
            icon:Image.asset('lib/source/icon/app-logo-80.png',width: 100,height: 100,),
            // icon:Icon(Icons.search),
            tooltip: '添加',
            onPressed:(){},
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            new Image.asset('lib/source/icon/app-logo-80.png',width: 100,height: 100,),
            new TextField(),
            Container(
              child:Theme(
                data:ThemeData(splashFactory: getoff.NoSplashFactory()),
                child:TextField(

                ),
              )
            )
          ],
        ),
      ),
    );
  }
}

