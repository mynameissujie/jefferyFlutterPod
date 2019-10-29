import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'decideHomepageWidget.dart' as decideWidget;
import 'customRefresh.dart' as refreshWidget;

import 'customTextField.dart' as TFWidget;
void main(){
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){
    runApp(_widgetForRoute(ui.window.defaultRouteName));
  });

}

// void main() => runApp(_widgetForRoute(ui.window.defaultRouteName));

Widget _widgetForRoute(String route){
  print('routerouterouteroute');
  print(route);
  switch (route) {
    case 'myApp':
      return MyApp();
    case 'HomePage':
      return NewHome();
    default:
      return MyApp();
  }
}

// void main() => runApp(MyApp());

class NewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CanvasWidget(canvasWidgetTitle:'canvas'),
      routes:<String,WidgetBuilder>{
        '/a':(BuildContext context) => MyApp(),
        '/b': (BuildContext context) => NewHome(),

      }
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
      ),
      // home:decideWidget.MyHomePage(homepageTitle: '首页',),
      home:refreshWidget.RefreshMy(title:'test'),
      routes:<String,WidgetBuilder>{
        '/a':(BuildContext context) => MyApp(),
        '/b': (BuildContext context) => NewHome(),
      },
      // initialRoute: '/a',
      // home: decideWidget.MovieList(movieType: 'Flutter Demo2 Home Page'),
      // home: TFWidget.MyForM(title: '输入框'),
      // home: CanvasWidget(),
    );
  }
}

class CanvasWidget extends StatefulWidget {
  CanvasWidget({Key key, this.canvasWidgetTitle}) : super(key: key);
  final String canvasWidgetTitle;
  @override
  CanvasState createState() => CanvasState();
}

class CanvasState extends State <CanvasWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('ML'),
      //   backgroundColor: Colors.red,
      // ),
      body: CustomPaint(
        painter: SignaturePainter(),
        child: Text(widget.canvasWidgetTitle),
      ),
    );
  }
}

//绘图 到底怎么用没明白
class  SignaturePainter extends CustomPainter {
  @override
   void paint(Canvas canvas, Size size) {
    var paint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5.0;
    Path path = new Path()..moveTo(100, 100);
    path.lineTo(200, 200);
    path.lineTo(200, 300);
    canvas.drawPath(path, paint);
    // canvas.drawCircle(Offset(100,100), 30, paint);
    // Rect rect2 = Rect.fromCircle(center: Offset(200,50),radius: 80);
    // canvas.drawArc(rect2, 0, math.pi/2, true, paint);

    // var myPoints = [Offset(10,10),Offset(30,30),Offset(80,80),Offset(300,300)];
    // canvas.drawPoints(ui.PointMode.points, myPoints, paint);
    // canvas.drawOval(Rect.fromPoints(Offset(100,200), Offset(300, 300)), paint);
    // //用Rect构建一个边长50,中心点坐标为100,100的矩形
    // Rect rect = Rect.fromCircle(center: Offset(100.0, 350.0), radius: 50.0);
    // //根据上面的矩形,构建一个圆角矩形
    // RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(10.0));
    // canvas.drawRRect(rrect, paint);

    //   //绘制两个矩形
    // Rect rect11 = Rect.fromCircle(center: Offset(100.0, 100.0), radius: 60.0);
    // Rect rect22 = Rect.fromCircle(center: Offset(100.0, 100.0), radius: 40.0);

    // RRect outer = RRect.fromRectAndRadius(rect11, Radius.circular(10.0));
    // RRect inner = RRect.fromRectAndRadius(rect22, Radius.circular(10.0));
    // canvas.drawDRRect(outer, inner, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


class MyFadeTestWidget extends StatefulWidget {
  MyFadeTestWidget({Key key,this.title}) :super(key:key);
  final String title;
  @override
  MyFadeTestState createState() => MyFadeTestState();
}

class MyFadeTestState extends State<MyFadeTestWidget> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;
  @override
  void initState() {
    super.initState();
    controller =AnimationController(duration: const Duration(milliseconds: 2000),vsync: this);
    curve =CurvedAnimation(parent: controller,curve: Curves.easeIn);
  }

  void fadeInLogo(){
    controller.forward();
  }

  void fadeOutLogo(){
    controller.reverse();
  }
  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: FadeTransition(
              opacity: curve,
              child: FlutterLogo(
                size: 100.0,
              ),
            ),
           ),
           FloatingActionButton(
              tooltip: 'FadeIn',
              child: Icon(Icons.brush),
              onPressed: fadeInLogo,
           ),
           FlatButton(
             child: Icon(Icons.comment),
             onPressed: () {
               controller.reverse();
             },
           )
         ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  MyWidgetState createState() => MyWidgetState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the ////lkkkp0oj this many times:',
              style: new TextStyle(
                fontSize: 24,
                fontFamily: "Georgia",
                color: Colors.grey[300]
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyWidgetState extends State<MyHomePage> {
  bool show =true;
  void _changeShow() {
    setState(() {
      show = !show;
    });
  }
  _getNewChild() {
    if (show) {
      return Text('need show');
    } else {
      return Text('no show');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:_getNewChild(),
        // child:Container(
        //   alignment: Alignment.center,
        //   child:Text(
        //     "LoremshuoipsumLoremmLorem ipsumLorem ipsumLoreipsum嘻嘻嘻嘻嘻",
        //     textAlign: TextAlign.left,
        //     maxLines: 3,
        //     style: new TextStyle(
        //       fontSize: 24.0,
        //       fontWeight: FontWeight.w900,
        //       fontFamily: "Georgia",
        //       color: Colors.blue,
        //     ),
        //   ),
        //   margin: new EdgeInsets.all(10),
        //   color: Colors.grey[300],
        //   width: 300,
        // )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeShow,
        tooltip: 'change',
        child: Icon(Icons.update),
      ),
    );
  }
}
