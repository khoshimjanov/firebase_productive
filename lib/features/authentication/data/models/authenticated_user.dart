import 'package:firebase_auth/firebase_auth.dart';
import 'package:productive/features/authentication/domain/entity/authenticated_user.dart';

class AuthenticatedUserModel extends AuthenticatedUserEntity{

  const AuthenticatedUserModel({required super.email});

  
  factory AuthenticatedUserModel.fromFirebaseUser(User user){
    return AuthenticatedUserModel(email: user.email ?? '');
  }
}