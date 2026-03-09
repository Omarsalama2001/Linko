import 'package:Linko/core/error/faliure.dart';
import 'package:Linko/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<UserEntity>>> getLiveUsers();
}
