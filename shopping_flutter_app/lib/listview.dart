import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

//void main() => runApp(new MyListApp());

class MyListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final TextStyle _biggerFont = new TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Start Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
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

  Widget _buildRow(WordPair suggestion) {
    final aleardySaved = _saved.contains(suggestion);
    return new ListTile(
      title: new Text(
        suggestion.asPascalCase,
        style: _biggerFont,
      ),
      //在每一行添加心型图标
      trailing: new Icon(
        aleardySaved ? Icons.favorite : Icons.favorite_border,
        color: aleardySaved ? Colors.red : null,
      ),
//      添加点击处理
      onTap: () {
        setState(() {
          if (aleardySaved) {
            _saved.remove(suggestion);
          } else {
            _saved.add(suggestion);
          }
        });
      },
    );
  }
}
