import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../entities/failure.dart';
import '../repositories/user_repository.dart';

class UpdateProfile {
  final UserRepository repository;
  UpdateProfile(this.repository);

  Future<Either<Failure, void>> call(User user) {
    return repository.updateProfile(user);
  }
}
