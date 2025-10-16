import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workout_app/Workout%20tracking/domain/entities/workout_exercise.dart';
import 'package:workout_app/Workout%20tracking/domain/entities/workout_log.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/workout_session.dart';
import '../../domain/repositories/workout_tracking_repository.dart';
import '../datasources/workout_tracking_remote_data_source.dart';
import '../models/workout_session_model.dart';

class WorkoutTrackingRepositoryImpl implements WorkoutTrackingRepository {
  final WorkoutTrackingRemoteDataSource remoteDataSource;

  WorkoutTrackingRepositoryImpl(this.remoteDataSource);

  Future<Either<Failure, void>> addWorkoutSession(WorkoutSession session) async {
    try {
      final model = WorkoutSessionModel(
        id: session.id,
        userId: session.userId,
        date: session.date,
        exercises: session.exercises,
        isCompleted: session.isCompleted,
      );
      await remoteDataSource.addWorkoutSession(model);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<WorkoutSession>>> getWorkoutSessions(String userId) async {
    try {
      final result = await remoteDataSource.getWorkoutSessions(userId);
      return Right(result); // Model extends Entity
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> updateWorkoutSession(WorkoutSession session) async {
    try {
      final model = WorkoutSessionModel(
        id: session.id,
        userId: session.userId,
        date: session.date,
        exercises: session.exercises,
        isCompleted: session.isCompleted,
      );
      await remoteDataSource.updateWorkoutSession(model);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> deleteWorkoutSession(String sessionId) async {
    try {
      await remoteDataSource.deleteWorkoutSession(sessionId);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, WorkoutSession>> completeSession(String sessionId) {
    // TODO: implement completeSession
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<WorkoutSession>>> getWorkoutHistory(String userId) {
    // TODO: implement getWorkoutHistory
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, WorkoutSession>> logExercise(String sessionId, String exerciseId, WorkoutLog log) {
    // TODO: implement logExercise
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, WorkoutSession>> startSession(String userId, List<WorkoutExercise> exercises) {
    // TODO: implement startSession
    throw UnimplementedError();
  }
}
