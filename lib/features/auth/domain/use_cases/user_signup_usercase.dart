import 'package:Linko/core/error/faliure.dart';
import 'package:Linko/features/auth/domain/entities/user_entity.dart';
import 'package:Linko/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UserSignUpUsecase {
  AuthRepository authRepository;

  UserSignUpUsecase({required this.authRepository});

  Future<Either<Failure, Unit>> call({required UserEntity userEntity, required String password}) {
    return authRepository.signUp(userEntity: userEntity, password: password);
  }
}
