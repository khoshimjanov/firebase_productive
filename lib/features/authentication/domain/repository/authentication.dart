import 'package:productive/core/either/either.dart';
import 'package:productive/features/authentication/domain/entity/authenticated_user.dart';

import '../../../../core/failure/failure.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, AuthenticatedUserEntity>> getUser();

  Future<Either<Failure, AuthenticatedUserEntity>> login(String email, String password);

  Future<Either<Failure, void>> logout();
}