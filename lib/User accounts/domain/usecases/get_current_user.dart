// lib/domain/user/usecases/get_current_user.dart
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetCurrentUser {
  final UserRepository repository;

  GetCurrentUser(this.repository);

  Future<Either<Failure, UserEntity>> call() {
    return repository.getCurrentUser();
  }
}
