import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/performance_summary.dart';
import '../../domain/entities/progress_record.dart';
import '../../domain/repositories/progress_repository.dart';
import '../../data/datasources/progress_remote_data_source.dart';
import '../models/performance_summary_model.dart';
import '../models/progress_record_model.dart';

class ProgressRepositoryImpl implements ProgressRepository {
  final ProgressRemoteDataSource remoteDataSource;

  ProgressRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<ProgressRecord>>> getProgressHistory(
      String userId) async {
    try {
      final result = await remoteDataSource.getProgressHistory(userId);
      return Right(result); // Model extends entity
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, PerformanceSummary?>> getPerformanceSummary(
      String userId) async {
    try {
      final result = await remoteDataSource.getPerformanceSummary(userId);
      return Right(result);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> updatePerformanceSummary(
      PerformanceSummary summary) async {
    try {
      final model = PerformanceSummaryModel(
        totalWorkoutsCompleted: summary.totalWorkoutsCompleted,
        performanceIncreasePercentage: summary.performanceIncreasePercentage,
        totalWeightLifted: summary.totalWeightLifted,
        averageRepsPerWorkout: summary.averageRepsPerWorkout,
      );
      await remoteDataSource.updatePerformanceSummary(model);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> addProgressRecord(
      ProgressRecord record) async {
    try {
      final model = ProgressRecordModel(
        id: record.id,
        date: record.date,
        workoutPlanId: record.workoutPlanId,
        totalDuration: record.totalDuration,
        totalReps: record.totalReps,
        totalWeightLifted: record.totalWeightLifted,
      );
      await remoteDataSource.addProgressRecord(model);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PerformanceSummary>> calculatePerformanceSummary(String userId) {
    // TODO: implement calculatePerformanceSummary
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, Unit>> resetProgress(String userId) {
    // TODO: implement resetProgress
    throw UnimplementedError();
  }
}
