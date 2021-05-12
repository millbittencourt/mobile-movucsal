import 'package:flutter/material.dart';
import 'package:mobile_movucsal/models/Spot.dart';
import 'package:mobile_movucsal/services/spotsApi.dart';

class PathPage extends StatefulWidget {
  PathPage({required this.spotOne, required this.spotTwo}) : super();

  final String spotOne;
  final String spotTwo;

  @override
  _PathPage createState() => _PathPage();
}

class _PathPage extends State<PathPage> {
  late Future<Spot> futureSpot;

  @override
  void initState() {
    super.initState();
    futureSpot = fetchDefaultSpot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Caminho encontrado"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            sendRequest(),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar!'),
            ),
          ],
        ),
      ),
    );
  }

  buscarCaminho(String pontoInicial, String pontoFinal) async {
    String pontoInicialId = pontoInicial.split('\.')[0];
    String pontoFinalId = pontoFinal.split('\.')[0];

    var result = await getPath(pontoInicialId, pontoFinalId);
      return result;
  }

  sendRequest() {
    return FutureBuilder<Spot>(
      future: futureSpot,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text(
                'Código: ' + snapshot.data!.codigo,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                'Descricao: ' + snapshot.data!.descricao,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                'Prédio: ' + snapshot.data!.predio,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                'Id: ' + snapshot.data!.id.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}
