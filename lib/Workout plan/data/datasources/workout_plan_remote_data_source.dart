import '../models/workout_plan_model.dart';

abstract class WorkoutPlanRemoteDataSource {
  Future<void> createWorkoutPlan(WorkoutPlanModel plan);
  Future<List<WorkoutPlanModel>> getWorkoutPlans(String userId);
  Future<void> updateWorkoutPlan(WorkoutPlanModel plan);
  Future<void> deleteWorkoutPlan(String planId);
}
