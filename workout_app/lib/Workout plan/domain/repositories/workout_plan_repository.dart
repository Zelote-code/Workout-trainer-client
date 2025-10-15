import 'package:dartz/dartz.dart';
import '../entities/workout_plan_entity.dart';
import '../../../core/error/failure.dart';

abstract class WorkoutPlanRepository {
  Future<Either<Failure, void>> createPlan(WorkoutPlanEntity plan);
  Future<Either<Failure, List<WorkoutPlanEntity>>> getPlans();
  Future<Either<Failure, void>> updatePlan(WorkoutPlanEntity plan);
  Future<Either<Failure, void>> deletePlan(String planId);
}
