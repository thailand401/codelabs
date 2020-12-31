import 'package:flutter/material.dart';
import 'package:codelabs/lessions/les2/ListTileModel.dart';

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text(
                "Bottom Sheet",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _openBottomSheet(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

void _openBottomSheet(context) {
  showModalBottomSheet(
    context: context,
    builder: (builder) {
      return new Container(
        padding: EdgeInsets.all(5.0),
        child: new Wrap(
          children: <Widget>[
            getListTile(Icons.more, Colors.black45, "More", context),
            getListTile(Icons.favorite, Colors.pink, "Favourites", context),
            getListTile(Icons.account_box, Colors.blue, "Profile", context),
            new Divider(
              thickness: 2.0,
              height: 10.0,
            ),
            getListTile(Icons.exit_to_app, null, "Logout", context),
          ],
        ),
      );
    },
  );
}
