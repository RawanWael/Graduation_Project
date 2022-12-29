import 'dart:convert';
import 'package:http/http.dart' as http;

String url = 'http://192.168.1.16:5000/';
final headers = {'Content-Type': 'application/json'};
postData(String Route, final passedBody) async {
  // print(jsonEncode(passedBody));
  http.Response response = await http.post(Uri.parse(url+Route), headers: headers,  body: json.encode(passedBody));
  return response.body;
}
getData(String Route) async {
  http.Response response = await http.get(Uri.parse(url+Route),  headers: headers);
  return response.body;
}
