import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'customString.dart' as myString;
// import 'myHomePageWidget.dart' as myNewHomepage;
import 'tabbar.dart' ;

class  MovieList  extends StatefulWidget{
  String movieType;
  MovieList({Key key,this.movieType}) :super(key:key);
  @override
  MovieListState createState() => MovieListState(movie: this.movieType);
  
}

class  MovieListState extends State<MovieList> {
  String movie;
  String typeName;
  List moveList =[];
  var currentPage = 0;
  @override
  void initState(){
    super.initState();
    loadData();
  }

  Future _pullToRefresh() async{
    currentPage = 0;
    setState(() {
      moveList.clear();
    });
    loadData();
    return null;
  }

  MovieListState({Key key,this.movie}) {
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(
      title: Text(myString.Strings.welcomeMessage),
      ),
      body: getBody(),
    );
  }
   
  showLoadingDialog(){
    if (moveList.length == 0) {
      return true;
    }
    return false;
  } 
  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else{
      return getListView();
    }
  }
  getListView(){
    return new RefreshIndicator(
        color: const Color(0xFF4483f6),
        child: ListView.builder(
          itemCount: moveList.length,
          itemBuilder: (BuildContext context,int position){
            return getColumn(position);
          },

        ),
        onRefresh: _pullToRefresh,
      );
  }
  getProgressDialog(){
    return Center(child: CircularProgressIndicator());
  }

  onItemClick(i){
    print(moveList[i]['title']);
  }

  Widget getCell(int i){
    return Container(
      padding: EdgeInsets.only(
        left: 30,
        top: 10,
        bottom: 30,
        right: 30,
      ),
      color: const Color(0xFFFF6633),
      child: Text(
        "Row ${moveList[i]['title']}",
              textAlign:TextAlign.left,
              style: new TextStyle(
                fontSize: 24,
                fontFamily: "Georgia",
                color: Colors.grey[300],
              ),
      ),
    );
  } 

  Widget getColumn(int i) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        GestureDetector( //添加手势方法
          onTap: () => onItemClick(i), //()=> 符号表示传递的是回调函数，不使用的话表示直接执行这个函数
          child: Container(
          padding: EdgeInsets.only(
            left: 30,
            top: 10,
            bottom: 30,
            right: 30,
            ),
          color: const Color(0xFFFF6633),
          child: Text(
            "Row ${moveList[i]['title']}",
            textAlign:TextAlign.left,
            style: new TextStyle(
                fontSize: 24,
                fontFamily: "Georgia",
                color: Colors.grey[300],
              ),
           ),
        ),
        ),
        
        Padding(
          padding: EdgeInsets.only(left: 0, top: 0.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              color: Colors.lightBlue,
              height: 1.0,
            )
          )
        ),
      ]
    );
  }
  Widget getRow(int i){
    return Column(
        children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
              "Row ${moveList[i]['title']}",
              textAlign:TextAlign.left,
              style: new TextStyle(
                fontSize: 24,
                fontFamily: "Georgia",
                color: Colors.grey[300],
              ),
            ),           
        ),
        Padding(
          padding: EdgeInsets.only(left: 12.0, top: 4.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              color: Colors.lightBlue,
              width: 375.0,
              height: 1.0,
        ),
      ),
    )
        ],
      );
  }

  loadData() async{
    String dataURL = 'https://jsonplaceholder.typicode.com/posts';
    http.Response response = await http.get(dataURL);
    setState(() {
      moveList = json.decode(response.body);
    });
  }

  

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.homepageTitle}) : super(key: key);
  final String homepageTitle;
  @override
  // MyWidgetState createState() => MyWidgetState();
  MyFormState createState() => MyFormState();
}

class MyFormState extends State<MyHomePage>{
  String userName;
  String password;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final passwordController =TextEditingController();
  void login(){
    print(_formKey);
    var loginForm = _formKey.currentState;
    if (loginForm.validate()){
      loginForm.save();
      print('userName:'+userName);
      print('password:'+password);
      // Navigator.pushNamed(context, '/b');
      // Navigator.of(context).pushNamed('/b').then((value){

      // });
      Navigator.of(context).push(new MaterialPageRoute(builder: (_){
        // return myNewHomepage.myHomeWidget(title: '我的首页首页',);
        return new MainPage();
      }));
    }
    print(loginForm);
  }

  @override
  void initState() {
    super.initState();
    passwordController.text = '我看一下';
    passwordController.addListener(() {
      print('input ${passwordController.text}');
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.homepageTitle),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Form(
                key:_formKey,
                
                child: Column(
                  children: <Widget>[
                    new Theme(
                      data:new ThemeData(
                        accentColor: Colors.yellow,
                        primaryColor: Colors.yellow,
                        primarySwatch: Colors.orange,
                        ),
                      child:new TextFormField(
                        style: TextStyle(
                          color:Colors.blue,
                        ),
                      decoration: new InputDecoration(
                        labelText: '请输入用户名',
                        labelStyle: new TextStyle(
                          color: Colors.red,
                        ),
                         border: UnderlineInputBorder(
                           borderSide: BorderSide(
                             color: Colors.red,
                           ),
                         ),
                         hintText: "留下你的精彩评论吧",
                         hintStyle: TextStyle(backgroundColor: Colors.red),
                       ),
                       onSaved: (value){
                        userName = value;
                       },
                       onFieldSubmitted: (value){

                       },
                      ),
                    ),
                    
                    new TextFormField(
                      controller:passwordController,
                      decoration: new InputDecoration(
                        labelText: '请输入密码',
                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: Colors.red,
                        //     ),
                        // ),
                        border: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                            ),
                            )
                      ),
                      obscureText:true,
                      validator: (value){
                        return value.length < 6 ? "密码长度不够六位":null;
                      },
                      onSaved: (value){
                        password = value;
                      },
                      onFieldSubmitted: (value){

                      },
                    ),
                    new SizedBox(
                      width:340,
                      height:42,
                      child: new RaisedButton(
                        onPressed:login,
                        child: new Text('登录'),
                      )
                    ),
                    ],
                ),
              ),    
              //  decoration: BoxDecoration(
              //   // color:Colors.red,
              //   border: new Border.all(
              //     color: Colors.red,
              //     width:8
              //   ),
              
              //   borderRadius: const BorderRadius.all(const Radius.circular(8)),
              // ),          
            ),
          ],
        ),
      ),
    );
  }
}

class MyWidgetState extends State<MyHomePage> {
  bool show =true;
  
  static const methodChannel = const MethodChannel('popToRoot');
  static const EventChannel eventChannel =const EventChannel('eventChannelName');
  @override
  void initState() {
    super.initState();
    // eventChannel.receiveBroadcastStream().listen(_onEvent,onError:_onError);
    eventChannel.receiveBroadcastStream({'key':'value1','key2':'value2'}).listen(_onEvent,onError:_onError);
  }

  void _onEvent(Object event) {
    setState(() {
      String myString = event.toString();
      Map<String,dynamic> map = json.decode(myString);
      print(map['name']);
      print(map['name']);
      print(map['name']);

      // print(event.toString());
      // print(event.toString());
      // print(event.toString());
    });
  }
  // 错误返回
  void _onError(Object error) {
    print('errorerror');
  }

  void pop() async{
    print('open native function');
    Map<String,dynamic>map = {'code':'200','data':[1,2,3]};
    await methodChannel.invokeMapMethod('pop',map);
  }
  getlist() async{
    var httpClient =new HttpClient();
    var url =new Uri.http('example.com', '/path1/path2',{'param1':'42','param2':'foo'});
    var request =await httpClient.getUrl(url);
    var response =await request.close();
    var responseBody =await response.transform(utf8.decoder).join();
    print(responseBody);
  }
  void _changeShow() {
    setState(() {
      show = !show;
    });
  }
  getNewChild() {
    if (show) {
      return Text('need show');
    } else {
      return Text('no show');
    }
  }

  @override
  Widget build(BuildContext context) {
    var vertical;
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      //   backgroundColor: Colors.orange,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: getNewChild(),
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                color:Colors.red,
                border: new Border.all(
                  color: Colors.grey,
                  width:8
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                )
                // borderRadius: BorderRadius.vertical(),
                // borderRadius:  BorderRadius.circular(8),
                // borderRadius: const BorderRadius.all(const Radius.circular(8)),
              ),
            ),
            FlatButton(onPressed: (){
              pop();
            },child: new Text('传参'),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeShow,
        tooltip: 'change',
        child: Icon(Icons.update),
      ),
    );
  }
}