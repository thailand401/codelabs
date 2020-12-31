import 'package:flutter/material.dart';
import 'package:codelabs/lessions/les3/contact_list_item.dart';
import 'package:codelabs/lessions/les3/modal/contact.dart';

class ContactsList extends StatelessWidget {
  final List<ContactModal> _contactModal;

  ContactsList(this._contactModal);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      children: _buildContactsList(),
    );
  }

  List<ContactListItem> _buildContactsList() {
    return _contactModal.map((contact) => ContactListItem(contact)).toList();
  }
}
