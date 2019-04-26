import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(new MyApp());

//void main() {
//  runApp(new MaterialApp(
//    home: new MyApp(),
//  ));
//}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter Demo1',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
//        fontFamily: 'fontdemo1'
      ),
      home: new MyHomePage(title: '文本及样式'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final textStyleAssetFont1 = const TextStyle(
    fontFamily: 'fontdemo1',
  );
  final textStyleAssetFont2 = const TextStyle(
    fontFamily: 'fontdemo2',
  );
  final textStyleAssetFont3 = const TextStyle(
    letterSpacing: 2.0,
  );
  final textStyleAssetFont4 = const TextStyle(
    height: 2.0,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          widget.title,
          style: textStyleAssetFont2,
        ),
      ),
      body: new Center(
        child: new Column(
//          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              "1.hi yun~",
              textAlign: TextAlign.start,
              style: textStyleAssetFont3,
            ),
            new Text(
              "2.hi yun~" * 16,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textStyleAssetFont4,
//              style: Theme.of(context).textTheme.display1,
            ),
            new Text(
              "3.hi yun~",
              textScaleFactor: 1.5,
              style: textStyleAssetFont4,
            ),
            new Text(
              "4.hi yun~" * 16,
              textAlign: TextAlign.start,
              style: textStyleAssetFont4,
            ),
            new Text(
              "5.hi yun~",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  height: 2.0,
                  fontFamily: "Courier",
                  background: new Paint()..color = Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            new Text(
              "红色+黑色删除线+25号",
              style: new TextStyle(
                color: const Color(0xffff0000),
                decoration: TextDecoration.lineThrough,
                decorationColor: const Color(0xff000000),
                fontSize: 25.0,
              ),
            ),
            new Text.rich(TextSpan(children: [
              TextSpan(text: "6.Yun:"),
              TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(
                  color: Colors.blue,
                  height: 2.0,
                ),
//                  recognizer: _tapRecognizer
              ),
            ])),
            DefaultTextStyle(
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.0,
                height: 2.0,
              ),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("7.hi yun1~"),
                  Text("7.hi yun2~"),
                  Text(
                    "7.hi yun3~",
                    style: TextStyle(
                      inherit: false,
                      color: Colors.grey,
                      height: 2.0,
                    ),
                  ),
                  Text(
                    "8.hi yun~",
                    style: textStyleAssetFont2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
