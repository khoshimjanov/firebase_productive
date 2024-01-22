part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final AuthenticatedUserEntity authenticatedUser;
  final AuthenticationStatus status;

  const AuthenticationState({
    required this.authenticatedUser,
    required this.status,
  });

  AuthenticationState copyWith({
    AuthenticatedUserEntity? authenticatedUser,
    AuthenticationStatus? status,
  }) {
    return AuthenticationState(
      authenticatedUser: authenticatedUser ?? this.authenticatedUser,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [authenticatedUser, status];
}

enum AuthenticationStatus {
  unknown,
  unauthenticated,
  authenticated,
}
