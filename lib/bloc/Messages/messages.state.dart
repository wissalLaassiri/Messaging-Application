import 'package:contact_application/bloc/Messages/messages.actions.dart';
import 'package:contact_application/enums/enums.dart';
import 'package:contact_application/model/messages.model.dart';

class MessagesState{
RequestState requestState;
  List<Message> messages;
  String msgErr;
  MessageEvent currentMsgEvent;

MessagesState(
    {this.requestState, this.messages, this.msgErr, this.currentMsgEvent});
MessagesState.initialState():
    requestState = RequestState.NONE,
  messages = [],
msgErr = "",
currentMsgEvent = null;

}