import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

//Stateless widgets 是不可变的, 这意味着它们的属性不能改变 - 所有的值都是最终的.

//Stateful widgets 持有的状态可能在widget生命周期中发生变化. 实现一个 stateful widget 至少需要两个类:

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

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Startup Name Generator1',
      home: new RadomWords(),
    );
  }
}
