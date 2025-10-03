import 'package:dartz/dartz.dart';
import '../entities/workout_plan.dart';
import '../entities/failure.dart';
import '../repositories/workout_plan_repository.dart';

class UpdateWorkoutPlan {
  final WorkoutPlanRepository repository;

  UpdateWorkoutPlan(this.repository);

  Future<Either<Failure, void>> call(WorkoutPlan plan) {
    return repository.updatePlan(plan);
  }
}
