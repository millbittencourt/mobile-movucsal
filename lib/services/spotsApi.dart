import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_movucsal/models/Spot.dart';
import 'package:mobile_movucsal/models/pathResponse.dart';

const URL_API = 'muv-ucsal.herokuapp.com';
const URL_LOCAL = 'localhost:8080'; //http

final erroGenerico = 'Erro ao carregar informações';

Future<PathResponse> buscarCaminho(
    String pontoInicialId, String pontoFinalId) async {
  var queryParameters = {
    'pontoInicialId': pontoInicialId,
    'pontoFinalId': pontoFinalId,
  };
  var uri = Uri.https(URL_API, '/agente', queryParameters);

  var response = await http.get(uri);

  if (response.statusCode == 200) {
    return PathResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(erroGenerico);
  }
}

Future<bool> existePonto(String id) async {
  final response = await http.get(Uri.https(URL_API, 'pontos/$id'));
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<List<Spot>> buscarPontos() async {
  final response = await http.get(Uri.https(URL_API, 'pontos/'));

  if (response.statusCode == 200) {
    final result = json.decode(response.body);
    return Spot.allFromJson(result)!;
  } else {
    throw Exception(erroGenerico);
  }
}
