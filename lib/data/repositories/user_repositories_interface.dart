import 'package:dartz/dartz.dart';
import '../../core/failures/failures.dart';
import '../../domain/entities/user_entity.dart';

abstract class UserRepositoryInterface {
  Future<Either<Failure, List<UserEntity>>> fetchUsers();
}
