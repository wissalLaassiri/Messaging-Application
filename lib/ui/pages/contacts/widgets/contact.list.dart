import 'package:contact_application/model/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsList extends StatelessWidget {
  List<Contact> contacts;

  ContactsList({this.contacts});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                height: 5,
                color: Colors.blueAccent,
              ),
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/messages',
                    arguments: contacts[index]);
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    CircleAvatar(
                      child: Text('${contacts[index].profile}'),
                      backgroundColor: Colors.indigo,
                      maxRadius: 33,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "${contacts[index].name}",
                    )
                  ]),
                  CircleAvatar(
                    child: Text('${contacts[index].score}'),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
