import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_app/locator.dart';
import 'package:very_good_app/src/modules/auth/models/auth_error.dart';
import 'package:very_good_app/src/modules/auth/models/register_request.dart';
import 'package:very_good_app/src/modules/auth/repo/auth_repo.dart';
import 'package:very_good_app/src/modules/auth/utils/auth_error_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final AuthRepo _r = g<AuthRepo>();

  register(RegisterRequest req) async {
    emit(RegisterLoading());
    try {
      await _r.register(req);
      emit(RegisterSuccess());
    } on DioError catch (e) {
      var authError = AuthErrorHelper.extractRegisterError(e);
      emit(RegisterFailed(authError));
    }
  }
}
