
import 'package:contact_application/enums/enums.dart';
import 'package:contact_application/model/contact.model.dart';

import 'contact.actions.dart';


class ContactsState{
  List<Contact> contacts;
  RequestState requestState;
  String errorMessage;
  ContactsEvent currentEvent;
  ContactsState({this.contacts,this.requestState,this.errorMessage,this.currentEvent});
}