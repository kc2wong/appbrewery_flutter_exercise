import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class NetworkHelper {
  final String url;

  NetworkHelper({@required this.url});

  Future<dynamic> getData() async {
    // Await the http get response, then decode the json-formatted responce.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
