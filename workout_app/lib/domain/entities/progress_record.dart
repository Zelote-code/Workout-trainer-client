import 'package:equatable/equatable.dart';

class ProgressRecord extends Equatable {
  final String id;
  final String workoutPlanId;
  final DateTime date;
  final double totalWeightLifted;
  final int totalReps;
  final Duration totalDuration;

  const ProgressRecord({
    required this.id,
    required this.workoutPlanId,
    required this.date,
    required this.totalWeightLifted,
    required this.totalReps,
    required this.totalDuration,
  });

  @override
  List<Object?> get props => [
        id,
        workoutPlanId,
        date,
        totalWeightLifted,
        totalReps,
        totalDuration,
      ];
}
