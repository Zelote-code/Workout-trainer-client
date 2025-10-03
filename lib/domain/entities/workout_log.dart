import 'package:equatable/equatable.dart';

class WorkoutLog extends Equatable {
  final int setNumber;
  final int actualReps;
  final double? actualWeight;

  const WorkoutLog({
    required this.setNumber,
    required this.actualReps,
    this.actualWeight,
  });

  @override
  List<Object?> get props => [setNumber, actualReps, actualWeight];
}
