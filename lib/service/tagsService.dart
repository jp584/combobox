import 'dart:convert';

import 'package:http/http.dart' as http;

import 'connectionService.dart';

class TagsService {
  final ConnectionService client;
  TagsService(this.client);




  // Get all tags by user ID
  // Future<Map<String, dynamic>> getTagsByUserId(User user) async {
  //   final uri = Uri.parse("${Globals.backURL}tags?user_id=${user.userId}");
  //   final Map<String, String> headers = {
  //     'Content-Type': 'application/json',
  //   };
  //   final http.Request request = http.Request('GET', uri)
  //     ..headers.addAll(headers);
  //   final http.StreamedResponse response = await client.send(request);
  //   final String responseBody = await response.stream.bytesToString();
  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     client.close();
  //     return json.decode(responseBody);
  //   } else {
  //     client.close();
  //     throw Exception("Error ${response.statusCode}");
  //   }
  // }


  // Get all tags by user ID
  Future<Map<String, dynamic>> getCountry() async {
    final uri = Uri.parse("http://localhost:8080/api/v1/country");
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final http.Request request = http.Request('GET', uri)
      ..headers.addAll(headers);
    final http.StreamedResponse response = await client.send(request);
    final String responseBody = await response.stream.bytesToString();
    print("HOLA");
    print(response.headers);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      client.close();
      return json.decode(responseBody);
    } else {


      client.close();
      throw Exception("Error ${response.statusCode}");
    }
  }

}
