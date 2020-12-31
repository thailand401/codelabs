import 'package:flutter/material.dart';

class ContactsGrid extends StatelessWidget {
  final List<Widget> _contactGrid;
  ContactsGrid(this._contactGrid);
  final ContactsBuilder myGridView = ContactsBuilder();

  @override
  Widget build(BuildContext context) {
    print(_contactGrid);
    return myGridView.build(this._contactGrid);
  }
}

class ContactsBuilder {
  GridView build(_contactGrid) {
    print(_contactGrid[0]);
    return GridView.count(
      primary: true,
      padding: const EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: _contactGrid,
    );
  }
}