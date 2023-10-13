import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front_end_control/service/connectionService.dart';
import 'package:front_end_control/service/tagsService.dart';
import 'package:http/http.dart' as http;

class ComboboxView extends StatefulWidget {
  const ComboboxView({super.key});

  @override
  State<ComboboxView> createState() => _ComboboxViewState();


}

class _ComboboxViewState extends State<ComboboxView> {
  @override
  Widget build(BuildContext context) {
    String? _selectedItem;

    Map<String, dynamic> data = {}; // Store the fetched data here

    // Function to fetch data from your API
    Future<void> fetchData() async {
      final response = await http.get(Uri.parse('http://localhost:8080/api/v1/country'));

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        setState(() {
          data = Map<String, dynamic>.from(decodedData); // Assuming your API returns a Map<String, dynamic>
        });
      } else {
        // Handle the error case
      }
    }

    @override
    void initState() {
      print("HOLA");
      super.initState();
      fetchData(); // Fetch data when the widget is initialized
    }


    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text("País"),
              DropdownButton<String>(
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
                items: <String>[
                  // Add your dropdown items here
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ],
          ),
          Row(
            children: [
              Text("Departamento"),
              DropdownButton<String>(
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
                items: <String>[
                  // Add your dropdown items here
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ],
          ),
          Row(
            children: [
              Text("Ciudad"),
              DropdownButton<String>(
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
                items: <String>[
                  // Add your dropdown items here
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ],
          )
        ],
      ),
    );
  }
}