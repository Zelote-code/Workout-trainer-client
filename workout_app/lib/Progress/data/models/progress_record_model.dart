import '../../domain/entities/progress_record.dart';

class ProgressRecordModel extends ProgressRecord {
  const ProgressRecordModel({
    required super.id,
    required super.workoutPlanId,
    required super.date,
    required super.totalDuration,
    required super.totalReps,
    required super.totalWeightLifted,
  });

  factory ProgressRecordModel.fromMap(Map<String, dynamic> map) {
    return ProgressRecordModel(
      id: map['id'] ?? '',
      workoutPlanId: map['workoutPlanId'] ?? '',
      date: DateTime.parse(map['date']),
      totalDuration: Duration(seconds: map['totalDuration'] ?? 0),
      totalReps: map['totalReps'] ?? 0,
      totalWeightLifted: (map['totalWeightLifted'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'workoutPlanId': workoutPlanId,
      'date': date.toIso8601String(),
      'totalDuration': totalDuration.inSeconds,
      'totalReps': totalReps,
      'totalWeightLifted': totalWeightLifted,
    };
  }
}
