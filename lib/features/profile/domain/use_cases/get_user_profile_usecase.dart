import 'package:Linko/core/error/faliure.dart';
import 'package:Linko/features/auth/domain/entities/user_entity.dart';
import 'package:Linko/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserProfileDataUsecase {
  final ProfileRepository profileRepository;
  GetUserProfileDataUsecase({
    required this.profileRepository,
  });

  Future<Either<Failure, UserEntity>> call() {
    return profileRepository.getUserProfileData();
  }
}
