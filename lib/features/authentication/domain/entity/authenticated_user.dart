class AuthenticatedUserEntity {
  final String email;
  final String? avatar;


  const AuthenticatedUserEntity({
    required this.email,
    this.avatar,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AuthenticatedUserEntity &&
      other.email == email &&
      other.avatar == avatar;
  }

  @override
  int get hashCode => email.hashCode ^ avatar.hashCode;

  @override
  String toString() => 'AuthenticatedUserEntity(email: $email, avatar: $avatar)';

  AuthenticatedUserEntity copyWith({
    String? email,
    String? avatar,
  }) {
    return AuthenticatedUserEntity(
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
    );
  }
}
