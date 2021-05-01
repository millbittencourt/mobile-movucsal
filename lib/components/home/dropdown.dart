// ignore: import_of_legacy_library_into_null_safe
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class DropdownForm extends StatefulWidget {
  //pegou a string
  const DropdownForm({
    required this.dropdownMessage,
    required this.onCountChanged,
  }) : super();

  final String dropdownMessage;
  //final String spotId;
  final Function(String) onCountChanged;

  //chamou quem trabalha
  @override
  _DropdownForm createState() => _DropdownForm();
}

class _DropdownForm extends State<DropdownForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String spotId = '';
    return DropDownField(
      onValueChanged: (dynamic value) {
        spotId = value;
        widget.onCountChanged(value);
      },
      value: spotId,
      required: false,
      hintText: widget.dropdownMessage,
      labelText: widget.dropdownMessage,
      items: <String>['One', 'Two', 'Three', 'Four'], //todo: lista da api,
    );
  }
}
