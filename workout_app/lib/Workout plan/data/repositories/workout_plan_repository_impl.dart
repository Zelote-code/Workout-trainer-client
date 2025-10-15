import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/workout_plan_entity.dart';
import '../../domain/repositories/workout_plan_repository.dart';
import '../datasources/workout_plan_remote_data_source.dart';
import '../models/workout_plan_model.dart';

class WorkoutPlanRepositoryImpl implements WorkoutPlanRepository {
  final WorkoutPlanRemoteDataSource remoteDataSource;

  WorkoutPlanRepositoryImpl(this.remoteDataSource);

  Future<Either<Failure, void>> createWorkoutPlan(WorkoutPlanEntity plan) async {
    try {
      final model = WorkoutPlanModel(
        id: plan.id,
        title: plan.title,
        createdBy: plan.createdBy,
        exercises: plan.exercises,
      );
      await remoteDataSource.createWorkoutPlan(model);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<WorkoutPlanEntity>>> getWorkoutPlans(String userId) async {
    try {
      final result = await remoteDataSource.getWorkoutPlans(userId);
      return Right(result); // returns list of WorkoutPlanModel (subclass of Entity)
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> updateWorkoutPlan(WorkoutPlanEntity plan) async {
    try {
      final model = WorkoutPlanModel(
        id: plan.id,
        title: plan.title,
        createdBy: plan.createdBy,
        exercises: plan.exercises,
      );
      await remoteDataSource.updateWorkoutPlan(model);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> deleteWorkoutPlan(String planId) async {
    try {
      await remoteDataSource.deleteWorkoutPlan(planId);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, void>> createPlan(WorkoutPlanEntity plan) {
    // TODO: implement createPlan
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, void>> deletePlan(String planId) {
    // TODO: implement deletePlan
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<WorkoutPlanEntity>>> getPlans() {
    // TODO: implement getPlans
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, void>> updatePlan(WorkoutPlanEntity plan) {
    // TODO: implement updatePlan
    throw UnimplementedError();
  }
}
