// lib/domain/user/repositories/user_repository.dart
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> signUp({
    required String email,
    required String password,
    required UserRole role,
  });

  Future<Either<Failure, UserEntity>> logIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> logOut();

  Future<Either<Failure, UserEntity>> getCurrentUser();

  Future<Either<Failure, UserEntity>> updateProfile(UserEntity user);
}
