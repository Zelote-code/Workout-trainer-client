import 'package:dartz/dartz.dart';
import '../entities/user_profile.dart';
import '../entities/failure.dart';

abstract class UserProfileRepository {
  Future<Either<Failure, UserProfile>> getProfile(String userId);
  Future<Either<Failure, UserProfile>> updateProfile(UserProfile profile);
}
