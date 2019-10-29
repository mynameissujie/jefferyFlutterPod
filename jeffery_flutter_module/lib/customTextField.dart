import 'package:flutter/material.dart';

class  MyForM  extends StatefulWidget{
  final String title;
  MyForM({Key key,this.title}) :super(key:key);
  @override
  MyFormState createState() => MyFormState();
  
}

enum customColor {
  blue,
  red
}

class MyFormState extends State<MyForM> {
  final myController =TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  customColor a = customColor.red;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
          decoration: InputDecoration(hintText: 'this is a hint'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          return showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                content: Text(myController.text),
              );
            }
          );
        },
        tooltip: 'show me the value~',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}