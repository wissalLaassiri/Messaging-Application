
import 'package:contact_application/model/contact.model.dart';
import 'package:contact_application/model/messages.model.dart';

abstract class MessageEvent<T>{
  T payload;
  MessageEvent(this.payload);
}

class MessagesByContactEvent extends MessageEvent<Contact>{
  MessagesByContactEvent(Contact payload) : super(payload);
}


class AddMessagesEvent extends MessageEvent<Message>{
  AddMessagesEvent(Message payload) : super(payload);
}