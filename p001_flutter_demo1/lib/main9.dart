import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//void main() => runApp(new MyApp());

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter Demo1',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "act.yun.page2": (context) => EchoRoute("内容固定"),
      },
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _add_counter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("跳转到第二个页面"),
              textColor: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, "act.yun.page2");
                debugDumpApp();//Widget 层
                debugDumpRenderTree();//渲染层
                debugDumpLayerTree();//层
//                Navigator.push(context,
//                    new MaterialPageRoute(builder: (context) {
//                  return new NewRoute();
//                }));
              },
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _add_counter,
        tooltip: '增加',
        child: new Icon(Icons.add),
      ),
    );
  }
}

class EchoRoute extends StatelessWidget {
  EchoRoute(this.tip);

  final String tip;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Echo route"),
      ),
      body: Center(
//        child: Text(tip),
        child: new RandomWordWidget(),
      ),
    );
  }
}

class RandomWordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}
