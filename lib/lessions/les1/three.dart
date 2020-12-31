import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:codelabs/lessions/les3/contact_grid.dart';

class ThirdTab extends StatefulWidget {
  @override
  MyGridView createState() => MyGridView();
}

class MyGridView  extends State<ThirdTab> {

  final String url =
      "https://api.airtable.com/v0/appxz494JfvEM6uv4/brands?maxRecords=30";
  List data;
  List<Widget> grid_data = [];

  GestureDetector getStructuredGridCell(name, image) {
    return GestureDetector(
      onTap: () {
        print("onTap called.");
      },
      child: Card(
          elevation: 1.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Image.network(image),
              Center(
                child: Text(name),
              )
            ],
          )),
    );
  }

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
        //print(dt['fields']['title']);
        grid_data.add(getStructuredGridCell(
            dt['fields']['title'], dt['fields']['phone'])
          );
      }
    });

    return "Successfull";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Grid Contact"),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
          child: GridView.count(
              crossAxisCount: 2, children: grid_data
          ),
        ),
    );
        //body: ContactsGrid(grid_data));
  }

  @override
  void initState() {
    super.initState();
    this.getJSONData();
  }
}
