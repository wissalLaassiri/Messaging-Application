import 'dart:math';

import 'package:contact_application/model/contact.model.dart';


class ContactsRepository{
  Map<int,Contact> contacts={
    1:Contact(id:1,name:"Otmane",profile:"Otmane",type: "Student",score:324),
    2:Contact(id:1,name:"Wissal",profile:"Wissal",type: "Developer",score:627),
    3:Contact(id:1,name:"Marwa",profile:"Marwa",type: "Student",score:337),
    4:Contact(id:1,name:"Amine",profile:"Amine",type: "Developer",score:752)
  };

  Future<List<Contact>> allContatcs() async {
    var future = await Future.delayed(Duration(seconds : 1));
    int rnd = new Random().nextInt(10);
    if(rnd>1){ //10% d'avoir des erreurs = Probabilite
      return contacts.values.toList();
    }else{
      throw new Exception("Internet Error");
    }
  }
  Future<List<Contact>> contactsByType(String type) async {
    var future = await Future.delayed(Duration(seconds : 1));
    int rnd = new Random().nextInt(10);
    if(rnd>3){
      return contacts.values.toList().where((element) => element.type == type).toList();
    }else{
      throw new Exception("Internet Error");
    }
  }
}