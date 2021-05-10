import 'package:contact_application/bloc/Messages/messages.actions.dart';
import 'package:contact_application/enums/enums.dart';
import 'package:contact_application/model/messages.model.dart';

class MessagesState {
  RequestState requestState;
  List<Message> messages;
  String msgErr;
  MessageEvent currentMsgEvent;
  List<Message> selectedMessages;

  MessagesState(
      {this.requestState,
      this.messages,
      this.msgErr,
      this.currentMsgEvent,
      this.selectedMessages});

  MessagesState.initialState()
      : requestState = RequestState.NONE,
        messages = [],
        msgErr = "",
        currentMsgEvent = null,
        selectedMessages = [];
}
