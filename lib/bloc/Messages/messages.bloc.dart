import 'package:bloc/bloc.dart';
import 'package:contact_application/bloc/Messages/messages.actions.dart';
import 'package:contact_application/bloc/Messages/messages.state.dart';
import 'package:contact_application/enums/enums.dart';
import 'package:contact_application/model/messages.model.dart';
import 'package:contact_application/repositories/messages.repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageBloc extends Bloc<MessageEvent,MessagesState>{
  MessageRepo messageRepo;
  MessageBloc({ @required MessagesState initialState, @required this.messageRepo}) : super(initialState);

  @override
  Stream<MessagesState> mapEventToState(MessageEvent event) async* {
    if(event is MessagesByContactEvent){
      yield MessagesState(requestState: RequestState.LOADING,messages:state.messages,currentMsgEvent: event ,selectedMessages: state.selectedMessages);
      try {
        List<Message> data = await messageRepo.messageByContact(event.payload.id);
        yield MessagesState(requestState: RequestState.LOADED,messages: data,currentMsgEvent: event,selectedMessages: state.selectedMessages);
      } catch (e) {
        yield MessagesState(requestState: RequestState.ERROR,msgErr: e.toString(),messages:state.messages,currentMsgEvent: event,selectedMessages: state.selectedMessages);
      }
    }
    else    if(event is AddMessagesEvent){
      //yield MessagesState(requestState: RequestState.LOADING,messages:state.messages,currentMsgEvent: event );
      try {
        event.payload.date=DateTime.now();
        Message msg = await messageRepo.addNewMessage(event.payload);
        List<Message> data = [...state.messages];
        data.add(msg);
        yield MessagesState(requestState: RequestState.LOADED,messages: data,currentMsgEvent: event,selectedMessages: state.selectedMessages);
      } catch (e) {
        yield MessagesState(requestState: RequestState.ERROR,msgErr: e.toString(),messages:state.messages,currentMsgEvent: event,selectedMessages: state.selectedMessages);
      }
    }
    else    if(event is SelectMessagesEvent){
      List<Message> messages =  state.messages;
      List<Message> messageSelected = [...state.selectedMessages];
      for(Message m in messages){
        if(m.id==event.payload.id){
          m.selected=!m.selected;
        }
        if(m.selected==true){
          messageSelected.add(m);
        }
        else{
          messageSelected.removeWhere((element)=> element.id==m.id);
        }
      }
      MessagesState messagesState = MessagesState(messages:messages,selectedMessages: messageSelected,currentMsgEvent:event,
          requestState: RequestState.LOADED);
      yield messagesState;
    }

    else    if(event is DeleteSelectedMessagesEvent){
      List<Message> messages =  state.messages;
      List<Message> messageSelected = [...state.selectedMessages];
      for(Message m in messageSelected){
        try {
          await messageRepo.deleteMessage(m);
          messages.removeWhere((element) => element.id==m.id);
          MessagesState messagesState = MessagesState(messages:messages,selectedMessages: messageSelected,currentMsgEvent:event,
              requestState: RequestState.LOADED);
          yield messagesState;
        } catch (e) {
          MessagesState messagesState = MessagesState(messages:messages,selectedMessages: messageSelected,currentMsgEvent:event,
              requestState: RequestState.ERROR);
          yield messagesState;        }
      }

    }
  }

}