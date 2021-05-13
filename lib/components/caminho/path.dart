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
          Expanded(child: buildList()),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Voltar!'),
          ),
        ],
      ),
    );
  }

  buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: widget.path.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 65,
          child: Column(children: [
            Text('${widget.path[index]}'),
          ]),
        );
      },
    );
  }

  Text formatResponse(List<String> data, BuildContext context) {
    return Text("");
  }
}
