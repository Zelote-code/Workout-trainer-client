import '../../domain/entities/workout_log.dart';

class WorkoutLogModel extends WorkoutLog {
  const WorkoutLogModel({
    required super.setNumber,
    required super.actualReps,
    super.actualWeight,
  });

  factory WorkoutLogModel.fromMap(Map<String, dynamic> map) {
    return WorkoutLogModel(
      setNumber: map['setNumber'] ?? 0,
      actualReps: map['actualReps'] ?? 0,
      actualWeight: (map['actualWeight'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'setNumber': setNumber,
      'actualReps': actualReps,
      'actualWeight': actualWeight,
    };
  }
}
