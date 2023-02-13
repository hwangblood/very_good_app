// ignore_for_file: unused_import

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:very_good_app/locator.dart';
import 'package:very_good_app/src/modules/auth/models/auth_error.dart';
import 'package:very_good_app/src/modules/auth/models/login_request.dart';
import 'package:very_good_app/src/modules/auth/repo/auth_repo.dart';
import 'package:very_good_app/src/modules/auth/utils/auth_error_helper.dart';
import 'package:very_good_app/src/services/storage/prefs.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final _r = g<AuthRepo>();

  login(LoginRequest request) async {
    emit(LoginLoading());
    try {
      var token = await _r.login(request);
      await Prefs.saveString(TOKENKEY, token);
      emit(LoginSuccess());
    } on DioError catch (e) {
      var err = AuthErrorHelper.extractLoginError(e);
      emit(LoginFailed(err));
    }
  }
}
