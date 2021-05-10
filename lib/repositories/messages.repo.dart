import 'dart:math';

import 'package:contact_application/model/messages.model.dart';


class MessageRepo{
  int messageCount = 6;
  Map<int,Message> messages = {
    1 : Message(id: 1,contactID : 1,date: DateTime.now(),content: 'Hello hhhhhhhhhhhhhhhhhhhhhhhh hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh hhhhhhhhhh hhhhhhhhhhhhhhhhhhhhhhhh hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh hhhhhhhhhh',type: 'sent'),
    2 : Message(id: 2,contactID : 1,date: DateTime.now(),content: 'yeah, Hii okeyyyyyyyy teeesttttttt tt tttttttttjh jhfhdhjdsjh ',type: 'received'),
    3 : Message(id: 3,contactID : 1,date: DateTime.now(),content: 'How arrrrre u',type: 'sent'),
    4 : Message(id: 4,contactID : 1,date: DateTime.now(),content: 'Im goooood wht abt u',type: 'received'),
    5 : Message(id: 5,contactID : 2,date: DateTime.now(),content: 'noo',type: 'received'),
    6 : Message(id: 6,contactID : 2,date: DateTime.now(),content: 'Any time ',type: 'sent'),
  };

  MessageRepo(){
   this.messageCount=messages.length;
  }
  Future allMessages() async {
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if(rnd>1){
      return messages.values.toList();
    }
    else{
      throw new Exception('Internet Error');
    }
  }

  Future<List<Message>> messageByContact(int contactID) async {
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if(rnd>1){ // 60% pour facilement avoir error
      return messages.values.toList().where((element) => element.contactID==contactID).toList();
    }
    else{
      throw new Exception('Internet Error');
    }
  }

  Future<Message> addNewMessage(Message message) async {
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if(rnd>1){ // 60% pour facilement avoir error
      message.id=++messageCount;
      messages[message.id]=message;
      return message;
    }
    else{
      throw new Exception('Internet Error');
    }
  }
}