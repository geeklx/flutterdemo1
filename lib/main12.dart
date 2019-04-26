import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

//Stateless widgets 是不可变的, 这意味着它们的属性不能改变 - 所有的值都是最终的.
//Stateful widgets 持有的状态可能在widget生命周期中发生变化. 实现一个 stateful widget 至少需要两个类:

class MyApp extends StatelessWidget {
  final textStyleAssetFont1 = const TextStyle(
    height: 0.5,
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
          title: new Text('图片加载'),
        ),
        body: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
//              CustomScrollView(
//                slivers: <Widget>[
//
//                ],
//              ),
              new Text(
                "",
                style: textStyleAssetFont1,
              ),
              new Image(
                image: AssetImage("assets/images/food01.jpeg"),
                fit: BoxFit.fill,
                width: 120.0,
              ),
              new Text(
                "",
                style: textStyleAssetFont1,
              ),
              new Image.asset(
                "assets/images/food02.jpeg",
                width: 120.0,
                fit: BoxFit.cover,
              ),
              new Text(
                "",
                style: textStyleAssetFont1,
              ),
              new Image(
                image: NetworkImage(
                    "https://s1.51cto.com/images/20190423/1556012017949570.png"),
                width: 120.0,
                fit: BoxFit.contain,
              ),
              new Text(
                "",
                style: textStyleAssetFont1,
              ),
              new Image.network(
                "https://s1.51cto.com/images/20190423/1556012017949570.png",
                width: 120.0,
                fit: BoxFit.fill,
              ),
              new Text(
                "",
                style: textStyleAssetFont1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.accessible,
                    color: Colors.green,
                  ),
                  Icon(
                    Icons.error,
                    color: Colors.green,
                  ),
                  Icon(
                    Icons.fingerprint,
                    color: Colors.green,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    MyIcons.qq,
                    color: Colors.red,
                  ),
                  Icon(
                    MyIcons.wechat,
                    color: Colors.green,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyIcons {
  // book 图标
  static const IconData qq =
      const IconData(0xe606, fontFamily: 'iconfont', matchTextDirection: true);

  // 微信图标
  static const IconData wechat =
      const IconData(0xe607, fontFamily: 'iconfont', matchTextDirection: true);
}
