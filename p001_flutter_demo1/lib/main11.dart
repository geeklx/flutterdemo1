import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

//Stateless widgets 是不可变的, 这意味着它们的属性不能改变 - 所有的值都是最终的.
//Stateful widgets 持有的状态可能在widget生命周期中发生变化. 实现一个 stateful widget 至少需要两个类:

class MyApp extends StatelessWidget {
  final textStyleAssetFont1 = const TextStyle(
    height: 2.0,
  );

  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
//        fontFamily: 'fontdemo1'
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('按钮样式'),
        ),
        body: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                'Hello World',
                style: textStyleAssetFont1,
              ),
              new RaisedButton(
                child: Text("normal"),
                onPressed: () => {},
              ),
              new Text(
                '',
                style: textStyleAssetFont1,
              ),
              new FlatButton(
                child: Text("normal"),
                onPressed: () => {},
              ),
              new Text(
                '',
                style: textStyleAssetFont1,
              ),
              new OutlineButton(
                onPressed: () => {},
                child: Text("normal"),
              ),
              new Text(
                '',
                style: textStyleAssetFont1,
              ),
              new IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () => {},
              ),
              new Text(
                '',
                style: textStyleAssetFont1,
              ),
              new FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () => {},
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
