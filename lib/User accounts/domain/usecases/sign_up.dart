// lib/domain/user/usecases/sign_up.dart
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class SignUp {
  final UserRepository repository;

  SignUp(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
    required UserRole role,
  }) {
    return repository.signUp(
      email: email,
      password: password,
      role: role,
    );
  }
}
