import 'package:equatable/equatable.dart';
import 'workout_log.dart';

class WorkoutExercise extends Equatable {
  final String exerciseId;
  final String name;
  final int sets;
  final int reps;
  final double? weight;
  final List<WorkoutLog> logs;

  const WorkoutExercise({
    required this.exerciseId,
    required this.name,
    required this.sets,
    required this.reps,
    this.weight,
    this.logs = const [],
  });

  @override
  List<Object?> get props => [exerciseId, name, sets, reps, weight, logs];
}
