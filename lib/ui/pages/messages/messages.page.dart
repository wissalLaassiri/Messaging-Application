import 'package:contact_application/bloc/Messages/messages.actions.dart';
import 'package:contact_application/bloc/Messages/messages.bloc.dart';
import 'package:contact_application/bloc/Messages/messages.state.dart';
import 'package:contact_application/enums/enums.dart';
import 'package:contact_application/model/contact.model.dart';
import 'package:contact_application/ui/shared/error.retry.action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesPage extends StatelessWidget {
  Contact contact;

  @override
  Widget build(BuildContext context) {
    this.contact = ModalRoute.of(context).settings.arguments;
    context.read<MessageBloc>().add(MessagesByContactEvent(this.contact));
    return Scaffold(
        appBar: AppBar(
          title: Text('Messages of ${contact.name}'),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Text('${contact.profile}'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('${contact.name}')
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<MessageBloc, MessagesState>(
                builder: (context, state) {
                  if(state.requestState==RequestState.LOADING){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }else if(state.requestState==RequestState.ERROR){
                    return ErrorRetryMessage(errorMsg:
                      state.msgErr,
                    onAction: (){
                      context.read<MessageBloc>().add(state.currentMsgEvent);
                    },) ;
                  }else if(state.requestState==RequestState.LOADED){
                    return ListView.separated(
                        itemBuilder: (context, index) => ListTile(
                          title: Row(
                            children: [
                              Text('${state.messages[index].content}')
                            ],
                          ),
                        ),
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.blue,
                          height: 3,
                        ),
                        itemCount: state.messages.length);
                  }else{
                    return Container();
                  }

                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomLeft,
              child: Text('input'),
            )
          ],
        ));
  }
}
