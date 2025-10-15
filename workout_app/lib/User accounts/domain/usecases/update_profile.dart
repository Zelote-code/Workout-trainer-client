// lib/domain/user/usecases/update_profile.dart
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class UpdateProfile {
  final UserRepository repository;

  UpdateProfile(this.repository);

  Future<Either<Failure, UserEntity>> call(UserEntity user) {
    return repository.updateProfile(user);
  }
}
