import 'package:contact_application/bloc/contacts/contact.actions.dart';
import 'package:contact_application/ui/pages/contacts/widgets/contact.buttons.item.dart';
import 'package:flutter/material.dart';

class ContactsBarButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContactsButtonsItem(buttonLabel:'All Contacts',contactsEvent: new LoadAllContactsEvent()),
          ContactsButtonsItem(buttonLabel:'Developers',contactsEvent: new LoadDevelopersEvent()),
          ContactsButtonsItem(buttonLabel:'Students',contactsEvent: new LoadStudentEvent()),

        ],
      ),
    );
  }
}
