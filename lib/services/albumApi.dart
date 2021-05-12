import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_movucsal/models/Album.dart';

const URL_API = 'jsonplaceholder.typicode.com';

Future<Album> fetchDefaultAlbum() async {
  final response = await http.get(Uri.https(URL_API, 'albums/4'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<bool> albumExists(String id) async {
  final response = await http.get(Uri.https(URL_API, 'albums/$id'));
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<List<Album>> fetchAllAlbums() async {
  final response = await http.get(Uri.https(URL_API, 'albums/'));

  if (response.statusCode == 200) {
    final result = json.decode(response.body);

    return Album.allFromJson(result)!;
  } else {
    throw Exception('Failed to load album');
  }
}

