import 'package:bloc/bloc.dart';
import 'package:contact_application/bloc/Messages/messages.actions.dart';
import 'package:contact_application/bloc/Messages/messages.bloc.dart';
import 'package:contact_application/enums/enums.dart';
import 'package:contact_application/model/contact.model.dart';
import 'package:contact_application/repositories/contact.repo.dart';

import 'contact.actions.dart';
import 'contact.state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsRepository contactsRepository;
  MessageBloc messageBloc;

  ContactsBloc({ContactsState initialState, this.contactsRepository,this.messageBloc})
      : super(initialState);

  @override
  Stream<ContactsState> mapEventToState(ContactsEvent event) async* {
    if (event is LoadAllContactsEvent) {
      yield ContactsState(
          contacts: state.contacts,
          requestState: RequestState.LOADING,
          currentEvent: event);
      try {
        List<Contact> data = await contactsRepository.allContatcs();
        yield ContactsState(
            contacts: data,
            requestState: RequestState.LOADED,
            currentEvent: event,
            currentContact: data[0]);

      messageBloc.add(new MessagesByContactEvent(data[0]));
      } catch (e) {
        yield ContactsState(
            contacts: state.contacts,
            requestState: RequestState.ERROR,
            errorMessage: e.message,
            currentEvent: event);
      }
    } else if (event is LoadStudentEvent) {
      yield ContactsState(
          contacts: state.contacts,
          requestState: RequestState.LOADING,
          currentEvent: event);
      try {
        List<Contact> data = await contactsRepository.contactsByType('Student');
        yield ContactsState(
            contacts: data,
            requestState: RequestState.LOADED,
            currentEvent: event);
      } catch (e) {
        yield ContactsState(
            contacts: state.contacts,
            requestState: RequestState.ERROR,
            errorMessage: e.message,
            currentEvent: event);
      }
    } else if (event is LoadDevelopersEvent) {
      yield ContactsState(
          contacts: state.contacts,
          requestState: RequestState.LOADING,
          currentEvent: event);
      try {
        List<Contact> data =
            await contactsRepository.contactsByType('Developer');
        yield ContactsState(
            contacts: data,
            requestState: RequestState.LOADED,
            currentEvent: event);
        messageBloc.add(new MessagesByContactEvent(data[0]));
      } catch (e) {
        yield ContactsState(
            contacts: state.contacts,
            requestState: RequestState.ERROR,
            errorMessage: e.message,
            currentEvent: event);
      }
    }
  }
}
