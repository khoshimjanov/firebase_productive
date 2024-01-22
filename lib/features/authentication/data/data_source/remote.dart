import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/exception/exception.dart';

abstract class AuthenticationRemoteDataSource {
  Future<User> getUser();

  Future<User> login(String email, String password);

  Future<void> logout();

  factory AuthenticationRemoteDataSource() =>
      _AuthenticationRemoteDataSourceImpl();
}

class _AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  @override
  Future<User> getUser() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      if (FirebaseAuth.instance.currentUser == null) {
        throw ServerException(
          message: 'User is null',
          code: 140,
        );
      }
      return FirebaseAuth.instance.currentUser!;
    } on ServerException {
      rethrow;
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return await getUser();
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(message: "$error", code: 500);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw ServerException(message: 'Cannot logout the user', code: 500);
    }
  }
}
