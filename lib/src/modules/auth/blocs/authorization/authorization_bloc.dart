import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:very_good_app/src/services/network/dio_inst.dart';
import 'package:very_good_app/src/services/storage/prefs.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc() : super(AuthorizedAsGuest()) {
    add(CheckAuthorization());
  }

  @override
  Stream<AuthorizationState> mapEventToState(
    AuthorizationEvent event,
  ) async* {
    if (event is RemoveAuthorization) {
      dio.options.headers['Authorization'] = '';
      await Prefs.deleteString(TOKENKEY);
      yield AuthorizedAsGuest();
    }
    if (event is CheckAuthorization) {
      try {
        final token = Prefs.getString(TOKENKEY);
        if (token == null) {
          yield AuthorizedAsGuest();
        } else {
          dio.options.headers['Authorization'] = 'Bearer $token';
          yield AuthorizedAsUser();
        }
      } catch (e) {
        yield AuthorizedAsGuest();
      }
    }
  }
}
