import 'package:flutter/material.dart';
import 'package:mobile_movucsal/components/caminho/path.dart';
import 'package:mobile_movucsal/components/errorPage.dart';
import 'package:mobile_movucsal/services/spotsApi.dart';

import 'dropdown.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title}) : super();

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String spotOne = '';
  String spotTwoId = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //todo: (last) criar AppBar component
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: searchPathBySpots(),
          ),
        ),
      ),
    );
  }

  Column searchPathBySpots() {
    final String _dropdownOne = 'Selecione o Ponto Inicial';
    final String _dropdownTwo = 'Selecione o Ponto Final';
    final String _dropdownChooseMessage =
        'Escolha seu ponto inicial \n e de destino';

    return Column(
      children: <Widget>[
        Text(
          _dropdownChooseMessage,
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40),
        DropdownForm(
          dropdownMessage: _dropdownOne,
          onCountChanged: (String val) {
            setState(() => spotOne = val);
          },
        ),
        SizedBox(height: 15),
        DropdownForm(
          dropdownMessage: _dropdownTwo,
          onCountChanged: (String val) {
            setState(() => spotTwoId = val);
          },
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            pesquisarPontos(spotOne, spotTwoId).then((spotResult) {
              spotResult
                  ?
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SecondRoute(title: '')) //todo: enviar o caminho
                      )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ErrorPage()),
                    );
            });
          },
          child: Text('Pesquisar rota'),
        ),
        SizedBox(height: 70),
      ],
    );
  }

  Future<bool> pesquisarPontos(String pontoInicial, String pontoFinal) async {
    if (pontoInicial == '' || pontoFinal == '') {
      return Future<bool>.value(false);
    }

    String pontoInicialId = pontoInicial.split('\.')[0];
    String pontoFinalId = pontoFinal.split('\.')[0];

    bool albumResult = await albumExists(pontoInicialId);
    if (albumResult == false) {
      return Future<bool>.value(false);
    }
    albumResult = await albumExists(pontoFinalId);
    if (albumResult == false) {
      return Future<bool>.value(false);
    }

    return Future<bool>.value(true);
  }
}
