import '../models/user_model.dart';
import '../../domain/entities/user_entity.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> signUp({
    required String email,
    required String password,
    required UserRole role,
  });

  Future<UserModel> logIn({
    required String email,
    required String password,
  });

  Future<void> logOut();

  Future<UserModel> getCurrentUser();

  Future<UserModel> updateProfile(UserModel user);
}
