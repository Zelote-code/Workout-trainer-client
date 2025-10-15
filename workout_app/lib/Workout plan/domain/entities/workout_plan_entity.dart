import 'package:equatable/equatable.dart';

class WorkoutExercise extends Equatable {
  final String name;
  final int sets;
  final int reps;
  final double? weight;
  final int? restSeconds;

  const WorkoutExercise({
    required this.name,
    required this.sets,
    required this.reps,
    this.weight,
    this.restSeconds,
  });

  @override
  List<Object?> get props => [name, sets, reps, weight, restSeconds];
}

class WorkoutPlanEntity extends Equatable {
  final String id;
  final String title;
  final String createdBy;
  final List<WorkoutExercise> exercises;

  const WorkoutPlanEntity({
    required this.id,
    required this.title,
    required this.createdBy,
    required this.exercises,
  });

  @override
  List<Object?> get props => [id, title, createdBy, exercises];
}
