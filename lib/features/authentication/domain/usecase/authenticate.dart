import 'package:productive/core/either/either.dart';

import 'package:productive/core/failure/failure.dart';
import 'package:productive/features/authentication/domain/entity/authenticated_user.dart';

import '../../../../core/usecase/usecase.dart';
import '../repository/authentication.dart';

class AuthenticateUseCase
    implements UseCase<AuthenticatedUserEntity, Params> {

  final AuthenticationRepository _repository;

  AuthenticateUseCase(AuthenticationRepository repository) : _repository = repository;

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> call(Params params) async {
    if (params is GetStatusParams) {
      return _repository.getUser();
    } else if (params is LoginParams) {
      return _repository.login(params.email, params.password);
     } else {
      throw UnimplementedError();
    }
  }
}

class AuthenticateUseCaseResponse {}

abstract class Params {}

class GetStatusParams extends Params {}

class LoginParams extends Params {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
