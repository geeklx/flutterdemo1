import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

//Stateless widgets 是不可变的, 这意味着它们的属性不能改变 - 所有的值都是最终的.

//Stateful widgets 持有的状态可能在widget生命周期中发生变化. 实现一个 stateful widget 至少需要两个类:

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Startup Name Generator1',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new RadomWords(),
    );
  }
}

class RadomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RadomWordsState();
  }
}

class RadomWordsState extends State<RadomWords> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator2'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestion(),
    );
  }

  final _suggestions = <WordPair>[];

  Widget _buildSuggestion() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  final TextStyle _biggerFont = new TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context) {
        final tiles = _saved.map(
          (pair) {
            return new ListTile(
              title: new Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
          },
        );
        final divided = ListTile.divideTiles(
          tiles: tiles,
          context: context,
        ).toList();
        return new Scaffold(
          appBar: new AppBar(
            title: new Text('Saved Suggestions'),
          ),
          body: new ListView(children: divided),
        );
      }),
    );
  }

  void aaa() {
    Future.delayed(new Duration(seconds: 2), () {
      return "hi yun~";
    }).then((data) {
      print(data);
    });

    Future.delayed(new Duration(seconds: 2), () {
      throw AssertionError("Yun Error");
    }).then((data) {
      //执行成功会走到这里
      print("yun success~");
    }).catchError((e) {
      //执行失败会走到这里
      print(e);
    });

    Future.delayed(new Duration(seconds: 2), () {
      throw AssertionError("yun error~");
    }).then((data) {
      print("yun success~");
    }, onError: (e) {
      print(e);
    });

    Future.delayed(new Duration(seconds: 2), () {
      throw AssertionError("yun error~");
    }).then((data) {
      //执行成功会走到这里
      print(data);
    }).catchError((e) {
      //执行失败会走到这里
      // loading success
      print(e);
    }).whenComplete(() {
      //无论成功或失败都会走到这里
      // loading success
    });

    Future.wait([
      // 2秒后返回结果
      Future.delayed(new Duration(seconds: 2), () {
        return "hi ";
      }),
      // 4秒后返回结果
      Future.delayed(new Duration(seconds: 4), () {
        return "yun~";
      })
    ]).then((results) {
      // 4秒后你会在控制台中看到“hi yun~”
      print(results[0] + results[1]);
    }).catchError((e) {
      print(e);
    });

    Future<String> login(String name, String pwd) {
      // 用户登录 返回id
    }

    Future<String> getInfo(String id) {
      // 获取用户信息 返回info
    }

    Future saveInfo(String info) {
      // 保存到本地
    }

    login("yun", "lx").then((id) {
      //登录成功后通过，id获取用户信息
      getInfo(id).then((info) {
        //获取用户信息后保存
        saveInfo(info).then((yun) {
          //保存用户信息，接下来执行其它操作
        });
      });
    });

    login("yun", "lx").then((id) {
      return getInfo(id);
    }).then((info) {
      return saveInfo(info);
    }).then((e) {
      //执行接下来的操作
      print(e);
    }).catchError((e) {
      //错误处理
      print(e);
    });

    task() async {
      try {
        String id = await login("yun", "lx");
        String info = await getInfo(id);
        await saveInfo(info);
        //执行接下来的操作

      } catch (e) {
        //错误处理
        print(e);
      }
    }

    Stream.fromFutures([
      Future.delayed(new Duration(seconds: 1), () {
        return "hi yun1";
      }),
      Future.delayed(new Duration(seconds: 2), () {
        throw AssertionError("yun error1");
      }),
      Future.delayed(new Duration(seconds: 3), () {
        return "hi yun3";
      })
    ]).listen((data) {
      print(data);
    }, onError: (e) {
      print(e);
    }, onDone: () {});
  }
}
