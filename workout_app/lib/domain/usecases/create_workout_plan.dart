import 'package:dartz/dartz.dart';
import '../entities/workout_plan.dart';
import '../entities/failure.dart';
import '../repositories/workout_plan_repository.dart';

class CreateWorkoutPlan {
  final WorkoutPlanRepository repository;

  CreateWorkoutPlan(this.repository);

  Future<Either<Failure, void>> call(WorkoutPlan plan) {
    return repository.createPlan(plan);
  }
}
