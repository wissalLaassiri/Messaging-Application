import 'package:contact_application/bloc/Messages/messages.actions.dart';
import 'package:contact_application/bloc/Messages/messages.bloc.dart';
import 'package:contact_application/bloc/Messages/messages.state.dart';
import 'package:contact_application/enums/enums.dart';
import 'package:contact_application/model/contact.model.dart';
import 'package:contact_application/ui/pages/messages/widgets/contact.info.widget.dart';
import 'package:contact_application/ui/pages/messages/widgets/message.form.widget.dart';
import 'package:contact_application/ui/pages/messages/widgets/messages.list.widget.dart';
import 'package:contact_application/ui/shared/circular.progress.ind.widget.dart';
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
          actions: [
            BlocBuilder<MessageBloc, MessagesState>(
                builder:(context, state) {
                  return CircleAvatar(child:
                  Text('${state.messages.length}'),
                  );
                }
            ),
            BlocBuilder<MessageBloc, MessagesState>(builder: (context, state) {
              if (state.selectedMessages.length > 0) {
                return IconButton(
                  icon: Icon(Icons.restore_from_trash),
                  onPressed: () {
                    context.read<MessageBloc>().add(new DeleteSelectedMessagesEvent());
                  },
                );
              } else {
                return Container();
              }
            })
          ],
        ),
        body: Column(
          children: [
            ContactInfoWidget(contact),
            Expanded(
              child: BlocBuilder<MessageBloc, MessagesState>(
                builder: (context, state) {
                  if (state.requestState == RequestState.LOADING) {
                    return MyProgressCircularIndicator();
                  } else if (state.requestState == RequestState.ERROR) {
                    return ErrorRetryMessage(
                      errorMsg: state.msgErr,
                      onAction: () {
                        context.read<MessageBloc>().add(state.currentMsgEvent);
                      },
                    );
                  } else if (state.requestState == RequestState.LOADED) {
                    return MessageListWidget(state.messages);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            MessageFormWidget(contact),
          ],
        ));
  }
}
