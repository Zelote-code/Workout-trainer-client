import 'package:dartz/dartz.dart';
import '../entities/user_profile.dart';
import '../entities/failure.dart';
import '../repositories/user_profile_repository.dart';

class UpdateUserProfile {
  final UserProfileRepository repository;
  UpdateUserProfile(this.repository);

  Future<Either<Failure, UserProfile>> call(UserProfile profile) {
    return repository.updateProfile(profile);
  }
}
