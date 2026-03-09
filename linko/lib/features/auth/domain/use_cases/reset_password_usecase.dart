import 'package:Linko/core/error/faliure.dart';
import 'package:Linko/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class ResetPasswordUseCase {
  AuthRepository authRepository;
  ResetPasswordUseCase({
    required this.authRepository,
  });
  Future<Either<Failure, Unit>> call({required String email}) async {
    return await authRepository.resetPassword(email: email);
  }
}
