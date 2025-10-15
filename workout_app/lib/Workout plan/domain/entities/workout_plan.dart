import 'package:equatable/equatable.dart';
import 'exercise.dart';

class WorkoutPlan extends Equatable {
  final String id;
  final String name;
  final List<Exercise> exercises;

  const WorkoutPlan({
    required this.id,
    required this.name,
    required this.exercises,
  });

  @override
  List<Object?> get props => [id, name, exercises];
}
