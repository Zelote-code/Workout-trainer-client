import 'package:dartz/dartz.dart';
import '../entities/workout_session.dart';
import '../entities/workout_exercise.dart';
import '../entities/workout_log.dart';
import '../entities/failure.dart';

abstract class WorkoutTrackingRepository {
  Future<Either<Failure, WorkoutSession>> startSession(
      String userId, List<WorkoutExercise> exercises);

  Future<Either<Failure, WorkoutSession>> logExercise(
      String sessionId, String exerciseId, WorkoutLog log);

  Future<Either<Failure, WorkoutSession>> completeSession(String sessionId);

  Future<Either<Failure, List<WorkoutSession>>> getWorkoutHistory(
      String userId);
}
