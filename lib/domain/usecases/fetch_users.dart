import 'package:dartz/dartz.dart';

import '../../core/failures/failures.dart';
import '../../data/repositories/user_repositories_interface.dart';
import '../entities/user_entity.dart';

abstract class FetchUsersUseCase {
  Future<Either<Failure, List<UserEntity>>> call();
}

class FetchUsers implements FetchUsersUseCase {
  final UserRepositoryInterface repository;

  FetchUsers(this.repository);

  @override
  Future<Either<Failure, List<UserEntity>>> call() async {
    return await repository.fetchUsers();
  }
}
