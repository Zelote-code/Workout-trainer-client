import 'package:equatable/equatable.dart';
import 'workout_exercise.dart';

class WorkoutSession extends Equatable {
  final String id;
  final String userId;
  final DateTime date;
  final List<WorkoutExercise> exercises;
  final bool isCompleted;

  const WorkoutSession({
    required this.id,
    required this.userId,
    required this.date,
    required this.exercises,
    this.isCompleted = false,
  });

  @override
  List<Object?> get props => [id, userId, date, exercises, isCompleted];
}
