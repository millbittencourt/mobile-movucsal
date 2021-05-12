// ignore: import_of_legacy_library_into_null_safe
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:mobile_movucsal/models/Spot.dart';
import 'package:mobile_movucsal/services/spotsApi.dart';

/// This is the stateful widget that the main application instantiates.
class DropdownForm extends StatefulWidget {
  //pegou a string
  const DropdownForm({
    required this.dropdownMessage,
    required this.onCountChanged,
  }) : super();

  final String dropdownMessage;
  final Function(String) onCountChanged;

  //chamou quem trabalha
  @override
  _DropdownForm createState() => _DropdownForm();
}

class _DropdownForm extends State<DropdownForm> {
  late Future<List<Spot>> futureSpots;

  @override
  void initState() {
    super.initState();
    futureSpots = fetchAllSpots();
  }

  @override
  Widget build(BuildContext context) {
    String spotId = '';

    return FutureBuilder<List<Spot>>(
        future: futureSpots,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DropDownField( //todo: refator to accept key and string value
              onValueChanged: (dynamic value) {
                spotId = value;
                widget.onCountChanged(value);
              },
              value: spotId,
              required: false,
              hintText: widget.dropdownMessage,
              labelText: widget.dropdownMessage,
              items: formatSpots(snapshot.data!),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
        return CircularProgressIndicator();
        },
    );
  }

  List<String> formatSpots(List<Spot> data) {
    List<String> formattedList = [];

    for (var i = 0; i < data.length; i++) {
      formattedList.add(data[i].id.toString() + '. ' + data[i].descricao);
      //todo: alterar para código?
    }
    return formattedList;
    //return data?.map((album) => album.title).toList();
  }
}
