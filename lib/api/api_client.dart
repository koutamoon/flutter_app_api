import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class ApiClient {
  Future<Map<String, Object>> get(String url) async {
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
