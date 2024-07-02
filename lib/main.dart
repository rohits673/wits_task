import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/network/network.dart';
import 'data/repositories/user_repositories.dart';
import 'domain/usecases/fetch_users.dart';
import 'presentation/controllers/user_controller.dart';
import 'presentation/screens/user_list_screen.dart';

void main() {
  final apiClient = Api();
  final userRepository = UserRepository(apiClient);
  final fetchUsers = FetchUsers(userRepository);
  Get.put(UserController(fetchUsers));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserListScreen(),
    );
  }
}
