import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/material.dart';


class  RefreshMy  extends StatefulWidget{
  final String title;
  RefreshMy({Key key,this.title}) :super(key:key);
  @override
  RefreshMyState createState() => RefreshMyState();
  
}

enum customColor {
  blue,
  red
}

class RefreshMyState extends State<RefreshMy> {
   // 总数
  int _count = 20;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
       body: EasyRefresh(
         onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {
              _count = 20;
            });
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {
              _count += 20;
            });
          });
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('EasyRefresh'),
              Text('EasyRefresh'),
              Text('EasyRefresh'),
            ],
          ),
        ),
      ),
    );
  }
}