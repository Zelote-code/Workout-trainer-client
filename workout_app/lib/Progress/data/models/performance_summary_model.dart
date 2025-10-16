import '../../domain/entities/performance_summary.dart';

class PerformanceSummaryModel extends PerformanceSummary {
  const PerformanceSummaryModel({
    required super.totalWorkoutsCompleted,
    required super.performanceIncreasePercentage,
    required super.totalWeightLifted,
    required super.averageRepsPerWorkout, 
  });

  factory PerformanceSummaryModel.fromMap(Map<String, dynamic> map) {
    return PerformanceSummaryModel(
      totalWorkoutsCompleted: map['totalWorkoutsCompleted'] ?? 0,
      performanceIncreasePercentage: (map['performanceIncreasePercentage'] as num?)?.toDouble() ?? 0.0,
      totalWeightLifted: (map['totalWeightLifted'] as num?)?.toDouble() ?? 0.0,
      averageRepsPerWorkout: (map['averageRepsPerWorkout'] as num?)?.toDouble() ?? 0.0, 
    );
  }

  String? get id => null;

  Map<String, dynamic> toMap() {
    return {
      'totalWorkoutsCompleted': totalWorkoutsCompleted,
      'performanceIncreasePercentage': performanceIncreasePercentage,
      'totalWeightLifted': totalWeightLifted,
      'averageRepsPerWorkout': averageRepsPerWorkout,
    };
  }
}
