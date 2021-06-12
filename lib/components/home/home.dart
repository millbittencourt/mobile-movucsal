import 'package:flutter/material.dart';
import 'package:movucsal/components/caminho/path.dart';
import 'package:movucsal/components/errorPage.dart';
import 'package:movucsal/services/spotsApi.dart';

import 'dropdown.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title}) : super();

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String spotOne = '';
  String spotTwo = '';
  bool isAccessible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        Row(
          children: [
            Text(
              "Desejo buscar apenas caminhos acessíveis",
              textAlign: TextAlign.center,
            ),
            Switch(
              value: isAccessible,
              onChanged: (value) {
                setState(() {
                  isAccessible = value;
                });
              },
            ),
          ],
        ),
        // Switch(value: false, onChanged: acessivel = value),
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
            setState(() => spotTwo = val);
          },
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            pesquisarPontos(spotOne, spotTwo).then((spotResult) {
              spotResult ? goToPathPage(spotOne, spotTwo, isAccessible) : goToErrorPage();
            });
          },
          child: Text('Pesquisar rota'),
        ),
        SizedBox(height: 70),
      ],
    );
  }

  Future goToErrorPage() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => ErrorPage()));

  Future goToPathPage(spotOne, spotTwo, isAcessible) async {
    String pontoInicialId = spotOne.split('\.')[0];
    String pontoFinalId = spotTwo.split('\.')[0];

    List<dynamic> caminhoTeste =
        await buscarCaminho(pontoInicialId, pontoFinalId, isAccessible).then((result) {
      if (result.pontosVisitados.isNotEmpty) return result.pontosVisitados;
      return [];
    });

    if (caminhoTeste.isNotEmpty) {
      return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PathPage(path: caminhoTeste),
          ));
    }
  }

  Future<bool> pesquisarPontos(String pontoInicial, String pontoFinal) async {
    if (pontoInicial == '' || pontoFinal == '') {
      return Future<bool>.value(false);
    }

    //waiting to DropdownChange...
    // String pontoInicialId = pontoInicial.split('\.')[0];
    // String pontoFinalId = pontoFinal.split('\.')[0];
    //
    // bool albumResult = await existePonto(pontoInicialId);
    // if (albumResult == false) {
    //   return Future<bool>.value(false);
    // }
    // albumResult = await existePonto(pontoFinalId);
    // if (albumResult == false) {
    //   return Future<bool>.value(false);
    // }

    return Future<bool>.value(true);
  }
}
