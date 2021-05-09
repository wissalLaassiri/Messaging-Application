
import 'package:contact_application/bloc/contacts/contact.actions.dart';
import 'package:contact_application/bloc/contacts/contact.bloc.dart';
import 'package:contact_application/bloc/contacts/contact.state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsButtonsItem extends StatelessWidget {
  String buttonLabel;
  ContactsEvent contactsEvent;
  ContactsButtonsItem({this.buttonLabel,this.contactsEvent});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc,ContactsState>(
      builder: (context,state){
        return Container(
          padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
          decoration: BoxDecoration(
              border: Border.all(
                  width: (state.currentEvent.runtimeType == contactsEvent.runtimeType)?2:0,
                  color: Colors.blue,
              ),
          ),
          child: RaisedButton(
            color: Colors.indigo,
            onPressed: () {
              context.read<ContactsBloc>().add(
                  contactsEvent);
            },
            child: Text(
              buttonLabel,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
