import 'package:Linko/core/error/faliure.dart';
import 'package:Linko/features/auth/domain/entities/user_entity.dart';
import 'package:Linko/features/lounge/domain/repositories/lounge_repository.dart';
import 'package:dartz/dartz.dart';

class GetLoungeUsersUsecase {
  final LoungeRepository loungeRepository;
  GetLoungeUsersUsecase({
    required this.loungeRepository,
  });

  Future<Either<Failure, List<UserEntity>>> call(String gender) {
    return loungeRepository.getLoungeUsers(gender);
  }
}
