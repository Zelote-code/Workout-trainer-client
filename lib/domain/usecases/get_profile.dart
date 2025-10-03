import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../entities/failure.dart';
import '../repositories/user_repository.dart';

class GetProfile {
  final UserRepository repository;
  GetProfile(this.repository);

  Future<Either<Failure, User>> call(String userId) {
    return repository.getProfile(userId);
  }
}
