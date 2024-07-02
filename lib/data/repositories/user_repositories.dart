import 'package:dartz/dartz.dart';
import 'package:wits_task/core/network/network.dart';

import '../../core/failures/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';
import 'user_repositories_interface.dart';

class UserRepository implements UserRepositoryInterface {
  final Api apiClient;

  UserRepository(this.apiClient);

  @override
  Future<Either<Failure, List<UserEntity>>> fetchUsers() async {
    final response = await apiClient.call(
      HTTP.GET,
      'https://jsonplaceholder.typicode.com/users',
    );

    return response.fold(
      (failure) => Left(failure),
      (response) {
        final List<dynamic> data = response.data;
        final List<UserEntity> users =
            data.map((json) => UserModel.fromJson(json)).toList();
        return Right(users);
      },
    );
  }
}
