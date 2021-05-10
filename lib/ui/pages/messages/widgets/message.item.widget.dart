import 'package:contact_application/bloc/Messages/messages.actions.dart';
import 'package:contact_application/bloc/Messages/messages.bloc.dart';
import 'package:contact_application/model/messages.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MessageItemWidget extends StatelessWidget {
  Message message;
  MessageItemWidget(this.message);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: message.selected,
      selectedTileColor: Color.fromARGB(60, 0, 155, 0),
      onLongPress: (){
        context.read<MessageBloc>().add(new SelectMessagesEvent(message));
      },
      title: Column(
        children :[
          Container(
            child: Text('(${message.date.year}-${message.date.month}-${message.date.day} : ${message.date.hour}h${message.date.minute})'),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey,width: 5),
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 5,),
          Row(
          mainAxisAlignment: (message.type=='sent')?MainAxisAlignment.start:MainAxisAlignment.end,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.all(20),
                color:(message.type=='sent')? Color.fromARGB(20, 0, 255, 0):Color.fromARGB(50, 0, 0, 150),
                child:
                  Text('${message.content}' ),
                foregroundDecoration: BoxDecoration(
                  border: Border.all(color:Colors.white38),
                ),
              ),
            ),
            (message.type=='sent')?SizedBox(width: 40,):SizedBox(width: 0,)
          ],
        ),
        ],
      ),
    );
  }
}
