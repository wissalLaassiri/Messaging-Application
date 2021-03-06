import 'dart:math';

import 'package:contact_application/model/contact.model.dart';


class ContactsRepository{
  Map<int,Contact> contacts={
    1:Contact(id:1,name:"Otmane",profile:"Ot",type: "Student",score:140),
    2:Contact(id:2,name:"Wissal",profile:"Wiss",type: "Developer",score:247),
    3:Contact(id:3,name:"Marwa",profile:"Mar",type: "Student",score:156),
    4:Contact(id:4,name:"Zineb",profile:"Zin",type: "Developer",score:153),
    5:Contact(id:5,name:"Oumnia",profile:"Oum",type: "Student",score:457),
    6:Contact(id:6,name:"Faty",profile:"Fat",type: "Developer",score:144)
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