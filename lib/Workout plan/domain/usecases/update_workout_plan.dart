import 'package:dartz/dartz.dart';
import '../entities/workout_plan_entity.dart';
import '../../../core/error/failure.dart';
import '../repositories/workout_plan_repository.dart';

class UpdateWorkoutPlan {
  final WorkoutPlanRepository repository;

  UpdateWorkoutPlan(this.repository);

  Future<Either<Failure, void>> call(WorkoutPlanEntity plan) {
    return repository.updatePlan(plan);
  }
}
