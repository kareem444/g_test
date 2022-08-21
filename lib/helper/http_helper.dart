import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHelper {
  static get() async {
    http.Response response = await http.get(
      Uri.parse("https://run.mocky.io/v3/a5e2f2bb-363d-4bfb-b2d5-f447ef91be99"),
      headers: {},
    );
    return json.decode(response.body);
  }
}
