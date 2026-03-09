import 'package:Linko/core/error/faliure.dart';
import 'package:Linko/features/auth/domain/entities/user_entity.dart';
import 'package:Linko/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetLiveUsersUsecase {
  final HomeRepository homeRepository;
  GetLiveUsersUsecase({
    required this.homeRepository,
  });
  Future<Either<Failure, List<UserEntity>>> getLiveUsers() {
    return homeRepository.getLiveUsers();
  }
}
