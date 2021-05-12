import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_movucsal/models/Spot.dart';
import 'package:mobile_movucsal/models/pathResponse.dart';

const URL_API = 'muv-ucsal.herokuapp.com';
const URL_LOCAL = 'localhost:8080'; //http

final erroGenerico = 'Erro ao carregar informações';

Future<Spot> fetchDefaultSpot() async {
  final response = await http.get(Uri.http(URL_LOCAL, 'pontos/1'));

  if (response.statusCode == 200) {
    return Spot.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(erroGenerico);
  }
}

Future<PathResponse> getPath(String pontoInicialId, String pontoFinalId) async {
  final response = await http.get(Uri.http(URL_LOCAL,
      '/agente?pontoInicialId=$pontoInicialId&pontoFinalId=$pontoFinalId'));

  if (response.statusCode == 200) {
    return PathResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(erroGenerico);
  }
}

Future<bool> spotExists(String id) async {
  final response = await http.get(Uri.http(URL_LOCAL, 'pontos/$id'));
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<List<Spot>> fetchAllSpots() async {
  final response = await http.get(Uri.http(URL_LOCAL, 'pontos/'));

  if (response.statusCode == 200) {
    final result = json.decode(response.body);
    return Spot.allFromJson(result)!;
  } else {
    throw Exception(erroGenerico);
  }
}
