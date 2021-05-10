import 'package:contact_application/model/messages.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageItemWidget extends StatelessWidget {
  Message messages;
  MessageItemWidget(this.messages);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        children :[
          Container(
            child: Text('(${messages.date.year}-${messages.date.month}-${messages.date.day} : ${messages.date.hour}h${messages.date.minute})'),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey,width: 5),
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 5,),
          Row(
          mainAxisAlignment: (messages.type=='sent')?MainAxisAlignment.start:MainAxisAlignment.end,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.all(20),
                color:(messages.type=='sent')? Color.fromARGB(20, 0, 255, 0):Color.fromARGB(50, 0, 0, 150),
                child:
                  Text('${messages.content}' ),
                foregroundDecoration: BoxDecoration(
                  border: Border.all(color:Colors.white38),
                ),
              ),
            ),
            (messages.type=='sent')?SizedBox(width: 40,):SizedBox(width: 0,)
          ],
        ),
        ],
      ),
    );
  }
}
