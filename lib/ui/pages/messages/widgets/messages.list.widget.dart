import 'package:contact_application/model/messages.model.dart';
import 'package:contact_application/ui/pages/messages/widgets/message.item.widget.dart';
import 'package:flutter/material.dart';

class MessageListWidget extends StatelessWidget {
  List<Message> messages;
  ScrollController scrollController = new ScrollController();

  MessageListWidget(this.messages);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (scrollController.hasClients)
        this.scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
    return ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) => MessageItemWidget(messages[index]),
        separatorBuilder: (context, index) => Divider(
              color: Colors.white,
              height: 3,
            ),
        itemCount: messages.length);
  }
}
