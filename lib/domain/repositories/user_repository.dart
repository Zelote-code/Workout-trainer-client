import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../entities/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> signUp({
    required String email,
    required String password,
    required String name,
    required UserRole role,
  });

  Future<Either<Failure, User>> logIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> getProfile(String userId);

  Future<Either<Failure, void>> updateProfile(User user);
}
