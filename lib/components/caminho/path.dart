import 'package:flutter/material.dart';

class PathPage extends StatefulWidget {
  PathPage({required this.path}) : super();

  final List<dynamic> path;

  @override
  _PathPage createState() => _PathPage();
}

class _PathPage extends State<PathPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Caminho encontrado"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: widget.path.length > 0
                ? buildList()
                : const Center(child: Text('Caminho não existe.')),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Voltar!'),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }

  buildList() {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: widget.path.length,
      itemBuilder: (BuildContext context, int index) {
        // print(widget.path);
        return Container(
          height: 65,
          color: Colors.deepPurple[50],
          child: Center(child:
            Text(
              getDescricaoPonto(index),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  String getDescricaoPonto(int index) =>
      '${widget.path[index]["ponto"]["id"]}. '
      '${widget.path[index]["ponto"]["descricao"]} ('
      '${widget.path[index]["ponto"]["codigo"]}) '
      'Prédio ${widget.path[index]["ponto"]["predio"]} ';
  // 'Acessivel: ' + widget.path[index]["ponto"]["acessivel"] == 'true' ? 'sim' : 'não';
}
