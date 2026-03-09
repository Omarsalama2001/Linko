import 'package:Linko/core/error/faliure.dart';
import 'package:Linko/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SendEmailVerificationUseCase {
  AuthRepository authRepository;
  SendEmailVerificationUseCase({
    required this.authRepository,
  });

  Future<Either<Failure, Unit>> call() {
    return authRepository.sendEmailVerification();
  }
}
