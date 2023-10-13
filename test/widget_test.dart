// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:front_end_control/main.dart';
import 'package:front_end_control/service/connectionService.dart';
import 'package:front_end_control/service/tagsService.dart';

import 'package:http/http.dart' as http;

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {

    final url = Uri.parse('http://192.168.0.3:8080/api/v1/country'); // Define the URL

    final response = await http.get(url); // Perform a GET request

    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } else {
      print('Request failed with status: ${response.statusCode}');
    }

    // print("CHAU");
    // final String userAgent = 'My custom user agent';
    // final http.Client innerClient = http.Client();
    // final ConnectionService client = ConnectionService(userAgent, innerClient);
    // final tasksService = TagsService(client);
    //
    // try {
    //   Map<String,dynamic> response = await tasksService.getCountry();
    //   print(response);
    //
    // } catch (e){
    //   print(e);
    // }
  });
}
