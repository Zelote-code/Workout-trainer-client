import 'package:dartz/dartz.dart';
import '../entities/user_profile.dart';
import '../entities/failure.dart';
import '../repositories/user_profile_repository.dart';

class GetUserProfile {
  final UserProfileRepository repository;
  GetUserProfile(this.repository);

  Future<Either<Failure, UserProfile>> call(String userId) {
    return repository.getProfile(userId);
  }
}
