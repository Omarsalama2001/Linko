import 'package:Linko/core/error/faliure.dart';
import 'package:Linko/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UserLoginWithEmailAndPasswordUseCase {
  AuthRepository authRepository;
  UserLoginWithEmailAndPasswordUseCase({
    required this.authRepository,
  });

  Future<Either<Failure, Unit>> call({required String email, required String password}) {
    return authRepository.loginWithEmailAndPassword(email, password);
  }
}
