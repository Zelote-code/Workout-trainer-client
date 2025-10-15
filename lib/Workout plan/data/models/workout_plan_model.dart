import '../../domain/entities/workout_plan_entity.dart';

class WorkoutPlanModel extends WorkoutPlanEntity {
  const WorkoutPlanModel({
    required super.id,
    required super.title,
    required super.createdBy,
    required super.exercises,
  });

  factory WorkoutPlanModel.fromMap(Map<String, dynamic> map, String docId) {
    return WorkoutPlanModel(
      id: docId,
      title: map['title'] ?? '',
      createdBy: map['createdBy'] ?? '',
      exercises: (map['exercises'] as List<dynamic>)
          .map((e) => WorkoutExercise(
                name: e['name'],
                sets: e['sets'],
                reps: e['reps'],
                weight: (e['weight'] as num?)?.toDouble(),
                restSeconds: e['restSeconds'],
              ))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'createdBy': createdBy,
      'exercises': exercises
          .map((e) => {
                'name': e.name,
                'sets': e.sets,
                'reps': e.reps,
                'weight': e.weight,
                'restSeconds': e.restSeconds,
              })
          .toList(),
    };
  }
}
