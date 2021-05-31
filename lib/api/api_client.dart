import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class ApiClient {
  static const String GET_POKEMON_LIST_PATH = 'https://pokeapi.co/api/v2/pokemon';
  static const String GET_POKEMON_PATH = 'https://pokeapi.co/api/v2/pokemon/{pokemon}';

  Future<Map<String, Object>> _get(String url) async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, Object> responseBody = convert.jsonDecode(response.body);
      return responseBody;
    } else {
      Map<String, Object> responseBody = convert.jsonDecode(response.body);
      return responseBody;
    }
  }
}
