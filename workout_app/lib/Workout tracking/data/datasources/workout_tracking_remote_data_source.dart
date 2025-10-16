import '../models/workout_session_model.dart';

abstract class WorkoutTrackingRemoteDataSource {
  Future<void> addWorkoutSession(WorkoutSessionModel session);
  Future<List<WorkoutSessionModel>> getWorkoutSessions(String userId);
  Future<void> updateWorkoutSession(WorkoutSessionModel session);
  Future<void> deleteWorkoutSession(String sessionId);
}
