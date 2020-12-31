import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:codelabs/lessions/les3/contact_list.dart';
import 'package:codelabs/lessions/les3/modal/contact.dart';

class SecondTab extends StatefulWidget {
  @override
  MyGetHttpDataState createState() => MyGetHttpDataState();
}

class MyGetHttpDataState extends State<SecondTab> {
  final String url =
      "https://api.airtable.com/v0/appPosdEleymx942l/Contact4k?maxRecords=4000";
  List data;
  List<ContactModal> contacts = [];

  Future<String> getJSONData() async {
    var response = await http.get(
        Uri.encodeFull(url),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer keyzAKTDalx09sgph"
        });

    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      data = dataConvertedToJSON['records'];
      for (var dt in data) {
        contacts.add(ContactModal(
            fullName: dt['fields']['first_name'], email: dt['fields']['phone1']));
      }
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
    print(this.getJSONData());
  }
}
