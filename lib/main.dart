import 'package:contact_application/bloc/Messages/messages.bloc.dart';
import 'package:contact_application/bloc/Messages/messages.state.dart';
import 'package:contact_application/repositories/messages.repo.dart';
import 'package:contact_application/ui/pages/contactWithMessages/contact.message.dart';

import 'bloc/contacts/contact.bloc.dart';
import 'bloc/contacts/contact.state.dart';
import 'package:contact_application/repositories/contact.repo.dart';
import 'package:contact_application/ui/pages/contacts/contact.page.dart';
import 'package:contact_application/ui/pages/messages/messages.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'enums/enums.dart';

void main() {
  GetIt.instance.registerLazySingleton(() => new ContactsRepository());
  GetIt.instance.registerLazySingleton(() => new MessageRepo());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>MessageBloc(initialState: MessagesState.initialState(),
            messageRepo: GetIt.instance<MessageRepo>())),
        BlocProvider(create: (context) =>
            ContactsBloc(
             initialState:ContactsState(
                 contacts: [],
                 errorMessage: '',
                 requestState: RequestState.NONE),
                contactsRepository : GetIt.instance<ContactsRepository>(),
            ),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.indigo),
        routes: {
          '/contacts': (context) => ContactsPage(),
          '/messages': (context) => MessagesPage(),
          '/contactWithMsg': (context) => ContactWithMessage(),
        },
        initialRoute: '/contactWithMsg',
      ),
    );
  }
}