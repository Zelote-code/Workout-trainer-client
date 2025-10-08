import 'package:dartz/dartz.dart';
import '../entities/workout_session.dart';
import '../entities/workout_exercise.dart';
import '../repositories/workout_tracking_repository.dart';
import '../entities/failure.dart';

class StartWorkoutSession {
  final WorkoutTrackingRepository repository;

  StartWorkoutSession(this.repository);

  Future<Either<Failure, WorkoutSession>> call(
      String userId, List<WorkoutExercise> exercises) {
    return repository.startSession(userId, exercises);
  }
}
