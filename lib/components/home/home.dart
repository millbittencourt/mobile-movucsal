import 'package:flutter/material.dart';
import 'package:mobile_movucsal/components/caminho/path.dart';
import 'package:mobile_movucsal/components/errorPage.dart';

import 'dropdown.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title}) : super();

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        DropdownForm(dropdownMessage: _dropdownOne),
        SizedBox(height: 15),
        DropdownForm(dropdownMessage: _dropdownTwo),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            pesquisarPontos('1', '2')
                ? //aqui ja preciso ter os ids
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondRoute(title: '')) //todo: enviar os dois pontos
                    )
                : Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ErrorPage()),
                  );
          },
          child: Text('Pesquisar rota'),
        ),
        SizedBox(height: 70),
      ],
    );
  }

  bool pesquisarPontos(String pontoInicial, String pontoFinal) {
    //existe ponto? se nao, return false
    return false;
    //se existir, procure o caminho return true;
  }
}
