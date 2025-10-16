import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/workout_session.dart';
import 'workout_exercise_model.dart';

class WorkoutSessionModel extends WorkoutSession {
  const WorkoutSessionModel({
    required super.id,
    required super.userId,
    required super.date,
    required super.exercises,
    super.isCompleted
  });

  factory WorkoutSessionModel.fromMap(Map<String, dynamic> map, String docId) {
    final exercisesList = (map['exercises'] as List<dynamic>? ?? [])
        .map((e) => WorkoutExerciseModel.fromMap(Map<String, dynamic>.from(e)))
        .toList();

    return WorkoutSessionModel(
      id: docId,
      userId: map['userId'] ?? '',
      date: (map['date'] as Timestamp).toDate(),
      exercises: exercisesList,
      isCompleted: map['completed'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'date': date,
      'exercises': exercises.map((e) {
        if (e is WorkoutExerciseModel) return e.toMap();
        return WorkoutExerciseModel(
          exerciseId: e.exerciseId,
          name: e.name,
          logs: e.logs,
          sets: e.sets,
          reps: e.reps,
          weight: e.weight,
        ).toMap();
      }).toList(),
      'isCompleted': isCompleted,
    };
  }
}
