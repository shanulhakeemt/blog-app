import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UseCase _useCase;

  AuthBloc({required UseCase useCase})
      : _useCase = useCase,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      emit(AuthLoading());
      final res = await _useCase.call(UserSignUpParams(
          name: event.name, email: event.email, password: event.password));
      res.fold((failure) => emit(AuthFailure(failure.message)),
          (uid) => AuthSuccess(uid));
    });
  }
}
