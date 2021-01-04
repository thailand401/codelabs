import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ThirdTab extends StatefulWidget {
  @override
  MyGridView createState() => MyGridView();
}

class MyGridView extends State<ThirdTab> {
  Future<List<Brands>> seasons;

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
      body: FutureBuilder<List<Brands>>(
        future: seasons,
        builder: (context, seasons) {
          if (seasons.hasData) {
            return GridView.builder(
                itemCount: seasons.data.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      //                    <-- BoxDecoration
                      border: Border(bottom: BorderSide()),
                    ),
                    child: getStructuredGridCell(
                        seasons.data[index].name, seasons.data[index].url),
                  );
                });
          } else if (seasons.hasError) {
            return Text("Error");
          }
          return Text("Loading...");
        },
      ),
    );
  }

  Future<List<Brands>> getJSONData() async {
    List<Brands> rdata = [];
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
        rdata.add(Brands(
            name: dt['fields']['title'], url: dt['fields']['cover'][0]['url']));
      }
    });

    return rdata;
  }
}

class Brands {
  final String name;
  final String url;

  const Brands({this.name, this.url});
}
