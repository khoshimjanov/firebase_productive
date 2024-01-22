import 'package:productive/core/either/either.dart';
import 'package:productive/core/failure/failure.dart';
import 'package:productive/core/usecase/usecase.dart';
import 'package:productive/features/authentication/domain/repository/authentication.dart';

class LogoutUseCase implements UseCase<void, NoParams> {
  final AuthenticationRepository repository;

  LogoutUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.logout();
  }
}
