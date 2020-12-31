import 'package:flutter/material.dart';

class ThirdTab extends StatelessWidget {
  final MyGridView myGridView = MyGridView();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("GridView Example"),
        ),
        body: myGridView.build(),
      ),
    );
  }
}

class MyGridView {
  GestureDetector getStructuredGridCell(name, image) {
    // Wrap the child under GestureDetector to setup a on click action
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

  GridView build() {
    return GridView.count(
      primary: true,
      padding: const EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: <Widget>[
        getStructuredGridCell("Facebook",
            "https://dl.airtable.com/.attachments/3bd3ed483057b23e7e7d83a9ce57ed38/5a7cb2d0/Selection_001.jpg"),
        getStructuredGridCell("Twitter",
            "https://dl.airtable.com/.attachments/2709f05fcf16bd2185e50971f70d9192/6c1afa13/Selection_002.jpg"),
        getStructuredGridCell("Instagram",
            "https://dl.airtable.com/.attachments/f4f288130224a9dd33c642047d5ec7bc/d93c17e4/Selection_003.jpg"),
        getStructuredGridCell("Linkedin",
            "https://dl.airtable.com/.attachments/3bd3ed483057b23e7e7d83a9ce57ed38/5a7cb2d0/Selection_001.jpg"),
        getStructuredGridCell("Google Plus", "social/google_plus.png"),
        getStructuredGridCell("Launcher Icon", "ic_launcher.png"),
      ],
    );
  }
}
