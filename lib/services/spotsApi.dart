import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_movucsal/models/Album.dart';

const URL_API = 'jsonplaceholder.typicode.com';

///todo: change to fetchSpot
Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.https(URL_API, 'albums/4'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<Album>> fetchAllAlbums() async {
  final response = await http.get(Uri.https(URL_API, 'albums/'));

  if (response.statusCode == 200) {
    final result = json.decode(response.body);
    print(result);
    return Album.allFromJson(result)!;
  } else {
    throw Exception('Failed to load album');
  }
}
