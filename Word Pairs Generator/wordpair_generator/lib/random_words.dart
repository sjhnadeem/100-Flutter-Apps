import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _randomWordPairs = <WordPair>[];
  final _saveWordPairs = Set<WordPair>();

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        if (item.isOdd) return const Divider();
        final index = item ~/ 2;

        if (index >= _randomWordPairs.length) {
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_randomWordPairs[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saveWordPairs.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: const TextStyle(fontSize: 18.0),
      ),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saveWordPairs.remove(pair);
          } else {
            _saveWordPairs.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext) {
        final Iterable<ListTile> tiles = _saveWordPairs.map((WordPair pair) {
          return ListTile(
            title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16.0)),
          );
        });

        final List<Widget> divided =
            ListTile.divideTiles(context: context, tiles: tiles).toList();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Saved WordPairs'),
          ),
          body: ListView(children: divided),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WordPair Generator'), actions: <Widget>[
        IconButton(onPressed: _pushSaved, icon: Icon(Icons.list))
      ]),
      body: Center(child: _buildList()),
    );
  }
}
