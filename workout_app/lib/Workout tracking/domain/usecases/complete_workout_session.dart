import 'package:dartz/dartz.dart';
import '../entities/workout_session.dart';
import '../repositories/workout_tracking_repository.dart';
import '../../../core/error/failure.dart';

class CompleteWorkoutSession {
  final WorkoutTrackingRepository repository;

  CompleteWorkoutSession(this.repository);

  Future<Either<Failure, WorkoutSession>> call(String sessionId) {
    return repository.completeSession(sessionId);
  }
}
