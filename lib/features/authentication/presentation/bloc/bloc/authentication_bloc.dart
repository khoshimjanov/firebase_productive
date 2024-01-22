import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:productive/core/failure/failure.dart';
import 'package:productive/core/usecase/usecase.dart';
import 'package:productive/features/authentication/data/data_source/remote.dart';
import 'package:productive/features/authentication/data/repository/authentication.dart';
import 'package:productive/features/authentication/domain/entity/authenticated_user.dart';
import 'package:productive/features/authentication/domain/usecase/authenticate.dart';
import 'package:productive/features/authentication/domain/usecase/logout.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(const AuthenticationState(
          status: AuthenticationStatus.unknown,
          authenticatedUser: AuthenticatedUserEntity(email: ''),
        )) {
    on<AuthenticationGetStatusEvent>((event, emit) async {
      final usecase = AuthenticateUseCase(
        AuthenticationRepositoryImpl(
          dataSource: AuthenticationRemoteDataSource(),
        ),
      );

      final either = await usecase.call(GetStatusParams());

      either.either(
        (failure) {
          emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
        },
        (user) {
          emit(state.copyWith(
            status: AuthenticationStatus.authenticated,
            authenticatedUser: user,
          ));
        },
      );
    });

    on<AuthenticationLogoutRequestedEvent>((event, emit) async {
      final usecase = LogoutUseCase(
        repository: AuthenticationRepositoryImpl(
          dataSource: AuthenticationRemoteDataSource(),
        ),
      );

      final either = await usecase.call(NoParams());

      either.either(
        (failure) {},
        (user) {
          emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
        },
      );
    });

    on<AuthenticationLoginRequestedEvent>((event, emit) async {
      final usecase = AuthenticateUseCase(
        AuthenticationRepositoryImpl(
          dataSource: AuthenticationRemoteDataSource(),
        ),
      );

      final either = await usecase.call(LoginParams(
        email: event.email,
        password: event.password,
      ));

      either.either(
        (failure) {
          emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
          event.onFailure((failure as ServerFailure).message);
        },
        (user) {
          emit(state.copyWith(
            status: AuthenticationStatus.authenticated,
            authenticatedUser: user,
          ));
          event.onSuccess();
        },
      );
    });
  }
}
