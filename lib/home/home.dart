import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'dropdown.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),//todo: (last) criar AppBar component
      ),
      body: Center(
        child:  spotsButtons(wordPair, context),
      ),
    );
  }

  Column spotsButtons(WordPair wordPair, BuildContext context) {
    final String _buttonOne = 'Selecione o Ponto Inicial';
    final String _buttonTwo = 'Selecione o Ponto Final';

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Escolha seu ponto inicial \ne de destino',
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
          Row(
            children:<Widget>[
              Text('',
              style: Theme.of(context).textTheme.headline4,)
            ],
          ), //todo: achar uma maneira melhor de espaçar
          Dropdown(dropdownMessage: _buttonOne),
          Row(
            children:<Widget>[Text(''),],
          ),
          Dropdown(dropdownMessage: _buttonTwo),
        ],
      );
  }

}
