import 'package:contact_application/bloc/Messages/messages.actions.dart';
import 'package:contact_application/bloc/Messages/messages.bloc.dart';
import 'package:contact_application/model/contact.model.dart';
import 'package:contact_application/model/messages.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageFormWidget extends StatelessWidget {
  TextEditingController textEditingController = new TextEditingController();
  Contact contact;
  MessageFormWidget(this.contact);
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          Expanded(
              child:TextFormField(
                controller: textEditingController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Your Message",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ) ,
          ),
          IconButton(icon: Icon(Icons.send), onPressed: (){
            Message message = Message(type: 'sent',contactID: contact.id,content: textEditingController.text,selected: false);
            context.read<MessageBloc>().add(new AddMessagesEvent(message)) ;

            Message replay = Message(type: 'received',contactID: contact.id,content: 'good '+textEditingController.text,selected: false);
            context.read<MessageBloc>().add(new AddMessagesEvent(replay)) ;
            textEditingController.text="";
          })
        ],
      ),
    );
  }
}
