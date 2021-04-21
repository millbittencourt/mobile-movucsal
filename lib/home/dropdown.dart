import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class Dropdown extends StatefulWidget {
  //pegou a string
  const Dropdown({Key key, this.dropdownMessage}) : super(key: key);
  final String dropdownMessage;
  //chamou quem trabalha
  @override
  _Dropdown createState() => _Dropdown();
}

class _Dropdown extends State<Dropdown> {
  String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.dropdownMessage;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 20,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[widget.dropdownMessage, 'One', 'Two', 'Three', 'Four'] //todo: lista da api
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}