// lib/domain/user/usecases/log_in.dart
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class LogIn {
  final UserRepository repository;

  LogIn(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
  }) {
    return repository.logIn(
      email: email,
      password: password,
    );
  }
}
