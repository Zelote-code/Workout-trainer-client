import 'package:equatable/equatable.dart';

class PerformanceSummary extends Equatable {
  final double totalWeightLifted;
  final int totalWorkoutsCompleted;
  final double averageRepsPerWorkout;
  final double performanceIncreasePercentage;

  const PerformanceSummary({
    required this.totalWeightLifted,
    required this.totalWorkoutsCompleted,
    required this.averageRepsPerWorkout,
    required this.performanceIncreasePercentage,
  });

  @override
  List<Object?> get props => [
        totalWeightLifted,
        totalWorkoutsCompleted,
        averageRepsPerWorkout,
        performanceIncreasePercentage,
      ];

  get totalWorkouts => null;

  get averageWeightPerWorkout => null;

  get currentStreak => null;

  get id => null;
}
