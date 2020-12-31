import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:codelabs/lessions/les3/contact_list.dart';
import 'package:codelabs/lessions/les3/modal/contact.dart';

class MyHomePage extends StatefulWidget {
  @override
  MyGetHttpDataState createState() => MyGetHttpDataState();
}

class MyGetHttpDataState extends State<MyHomePage> {
  final String url =
      "https://api.airtable.com/v0/appxz494JfvEM6uv4/menu?maxRecords=15";
  List data;
  List<ContactModal> contacts = [];

  // Function to get the JSON data
  Future<String> getJSONData() async {
    var response = await http.get(
        // Encode the url
        Uri.encodeFull(url),
        // Only accept JSON response
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer keyzAKTDalx09sgph"
        });

    // Logs the response body to the console
    //rprint(response.body);

    // To modify the state of the app, use this method
    setState(() {
      // Get the JSON data
      var dataConvertedToJSON = json.decode(response.body);
      // Extract the required part and assign it to the global variable named data
      data = dataConvertedToJSON['records'];
      print("--------------------------------");
      for (var dt in data) {
        //print(dt);
        contacts.add(ContactModal(
            fullName: dt['fields']['title'], email: dt['fields']['price']));
      }
      print("--------------------------------");
    });

    return "Successfull";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List Contact"),
          backgroundColor: Colors.redAccent,
        ),
        body: ContactsList(contacts));
  }

  @override
  void initState() {
    super.initState();

    // Call the getJSONData() method when the app initializes
    print(this.getJSONData());
  }
}
