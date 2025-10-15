import 'package:dartz/dartz.dart';
import '../entities/workout_plan_entity.dart';
import '../../../core/error/failure.dart';
import '../repositories/workout_plan_repository.dart';

class GetWorkoutPlans {
  final WorkoutPlanRepository repository;

  GetWorkoutPlans(this.repository);

  Future<Either<Failure, List<WorkoutPlanEntity>>> call() {
    return repository.getPlans();
  }
}
