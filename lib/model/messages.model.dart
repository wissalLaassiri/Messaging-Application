class Message{
  int id;
  int contactID;
  DateTime date;
  String content;
  String type;
  bool selected=false;

  Message({this.id, this.contactID, this.date, this.content,this.type,this.selected});
}