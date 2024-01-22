part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {}

class AuthenticationGetStatusEvent extends AuthenticationEvent {}

class AuthenticationLogoutRequestedEvent extends AuthenticationEvent {}

class AuthenticationLoginRequestedEvent extends AuthenticationEvent {
  final String email;
  final String password;
  final VoidCallback onSuccess;
  final ValueChanged<String> onFailure;

  AuthenticationLoginRequestedEvent({
    required this.email,
    required this.password,
    required this.onSuccess,
    required this.onFailure,
  });
}
