import 'package:contact_application/bloc/contacts/contact.bloc.dart';
import 'package:contact_application/bloc/contacts/contact.state.dart';
import 'package:contact_application/enums/enums.dart';
import 'package:contact_application/ui/pages/contacts/widgets/contact.list.dart';
import 'package:contact_application/ui/pages/contacts/widgets/contacts.bar.buttons.dart';
import 'package:contact_application/ui/shared/error.retry.action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact')),
      body: Column(
        children: [
          ContactsBarButtons(),
          BlocBuilder<ContactsBloc,ContactsState>(builder: (context,state){
            if (state.requestState == RequestState.LOADING) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (state.requestState == RequestState.ERROR) {
                return ErrorRetryMessage(
                  errorMsg: state.errorMessage,
                  onAction: (){
                    context.read<ContactsBloc>().add(state.currentEvent);
                  },
                );
              }
              if(state.requestState == RequestState.LOADED){
                return ContactsList(contacts: state.contacts,);
              }
              else{
                return Container();
              }
            }
          })
        ],
      ),

    );
  }
}
