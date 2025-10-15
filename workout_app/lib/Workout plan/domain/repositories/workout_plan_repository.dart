import 'package:dartz/dartz.dart';
import '../entities/workout_plan.dart';
import '../../../core/error/failure.dart';

abstract class WorkoutPlanRepository {
  Future<Either<Failure, void>> createPlan(WorkoutPlan plan);
  Future<Either<Failure, List<WorkoutPlan>>> getPlans();
  Future<Either<Failure, void>> updatePlan(WorkoutPlan plan);
  Future<Either<Failure, void>> deletePlan(String planId);
}
