import 'package:dartz/dartz.dart';
import '../entities/workout_session.dart';
import '../repositories/workout_tracking_repository.dart';
import '../../../core/error/failure.dart';


class GetWorkoutHistory {
  final WorkoutTrackingRepository repository;

  GetWorkoutHistory(this.repository);

  Future<Either<Failure, List<WorkoutSession>>> call(String userId) {
    return repository.getWorkoutHistory(userId);
  }
}
