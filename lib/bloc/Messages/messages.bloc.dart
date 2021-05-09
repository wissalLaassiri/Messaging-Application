import 'package:bloc/bloc.dart';
import 'package:contact_application/bloc/Messages/messages.actions.dart';
import 'package:contact_application/bloc/Messages/messages.state.dart';
import 'package:contact_application/enums/enums.dart';
import 'package:contact_application/model/messages.model.dart';
import 'package:contact_application/repositories/messages.repo.dart';
import 'package:flutter/cupertino.dart';

class MessageBloc extends Bloc<MessageEvent,MessagesState>{
  MessageRepo messageRepo;
  MessageBloc({ @required MessagesState initialState, @required this.messageRepo}) : super(initialState);

  @override
  Stream<MessagesState> mapEventToState(MessageEvent event) async* {
    if(event is MessagesByContactEvent){
      yield MessagesState(requestState: RequestState.LOADING,messages:state.messages,currentMsgEvent: event );
      try {
        List<Message> data = await messageRepo.messageByContact(event.payload.id);
        yield MessagesState(requestState: RequestState.LOADED,messages: data,currentMsgEvent: event);
      } catch (e) {
        yield MessagesState(requestState: RequestState.ERROR,msgErr: e.toString(),messages:state.messages,currentMsgEvent: event);
      }
    }
  }

}