import '../../domain/entities/workout_exercise.dart';
import 'workout_log_model.dart';

class WorkoutExerciseModel extends WorkoutExercise {
  const WorkoutExerciseModel({
    required super.exerciseId,
    required super.name,
    required super.sets,
    required super.reps,
    super.weight,
    required super.logs,
  });

  factory WorkoutExerciseModel.fromMap(Map<String, dynamic> map) {
    final logsList = (map['logs'] as List<dynamic>? ?? [])
        .map((logMap) => WorkoutLogModel.fromMap(Map<String, dynamic>.from(logMap)))
        .toList();

    return WorkoutExerciseModel(
      exerciseId: map['exerciseId'] ?? '',
      name: map['name'] ?? '',
      sets: map['sets'] ?? 0,
      reps: map['reps'] ?? 0,
      weight: (map['weight'] as num?)?.toDouble(),
      logs: logsList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'exerciseId': exerciseId,
      'name': name,
      'logs': logs.map((e) {
        if (e is WorkoutLogModel) return e.toMap();
        return WorkoutLogModel(
          setNumber: e.setNumber,
          actualReps: e.actualReps,
          actualWeight: e.actualWeight,
        ).toMap();
      }).toList(),
    };
  }
}
