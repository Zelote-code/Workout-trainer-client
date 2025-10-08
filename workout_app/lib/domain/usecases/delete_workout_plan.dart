import 'package:dartz/dartz.dart';
import '../entities/failure.dart';
import '../repositories/workout_plan_repository.dart';

class DeleteWorkoutPlan {
  final WorkoutPlanRepository repository;

  DeleteWorkoutPlan(this.repository);

  Future<Either<Failure, void>> call(String planId) {
    return repository.deletePlan(planId);
  }
}
