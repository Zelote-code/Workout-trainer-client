import 'package:dartz/dartz.dart';
import '../entities/workout_session.dart';
import '../entities/workout_log.dart';
import '../repositories/workout_tracking_repository.dart';
import '../entities/failure.dart';

class LogExercise {
  final WorkoutTrackingRepository repository;

  LogExercise(this.repository);

  Future<Either<Failure, WorkoutSession>> call(
      String sessionId, String exerciseId, WorkoutLog log) {
    return repository.logExercise(sessionId, exerciseId, log);
  }
}
