import 'package:contact_application/bloc/Messages/messages.bloc.dart';
import 'package:contact_application/bloc/Messages/messages.state.dart';
import 'package:contact_application/bloc/contacts/contact.actions.dart';
import 'package:contact_application/bloc/contacts/contact.bloc.dart';
import 'package:contact_application/bloc/contacts/contact.state.dart';
import 'package:contact_application/enums/enums.dart';
import 'package:contact_application/ui/pages/messages/widgets/message.form.widget.dart';
import 'package:contact_application/ui/pages/messages/widgets/messages.list.widget.dart';
import 'package:contact_application/ui/shared/circular.progress.ind.widget.dart';
import 'package:contact_application/ui/shared/error.retry.action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactWithMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<ContactsBloc>().add(new LoadAllContactsEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text('contact with msg'),
      ),
      body: BlocBuilder<ContactsBloc, ContactsState>(
        builder: (context, state) => Column(
          children: [
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Text(
                            '${state.contacts[index].profile}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        Text(
                          '${state.contacts[index].name}',
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.blueAccent,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            '${state.contacts[index].score}',
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                itemCount: state.contacts.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
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
            MessageFormWidget(state.currentContact),
          ],
        ),
      ),
    );
  }
}
