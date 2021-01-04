import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainHome extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MainHome> {
  Future<List<String>> seasons;

  @override
  void initState() {
    super.initState();
    seasons = getJSONData();
  }

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

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<String>>(
        future: seasons,
        builder: (context, seasons) {
          if (seasons.hasData) {
            return GridView.builder(
                itemCount: seasons.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (context, index) {
                  return getStructuredGridCell(
                      seasons.data[index], "https://placeimg.com/150/100/any");
                });
          } else if (seasons.hasError) {
            return Text("Error");
          }
          return Text("Loading...");
        },
      ),
    );
  }

  Future<List<String>> getJSONData() async {
    List<String> rdata = [];
    final String url =
        "https://api.airtable.com/v0/appxz494JfvEM6uv4/brands?maxRecords=30";
    List data;
    var response = await http.get(Uri.encodeFull(url), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer keyzAKTDalx09sgph"
    });
    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      data = dataConvertedToJSON['records'];
      for (var dt in data) {
        rdata.add(dt['fields']['title']);
      }
    });

    return rdata;
  }
}
