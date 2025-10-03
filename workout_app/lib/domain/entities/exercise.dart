import 'package:equatable/equatable.dart';

class Exercise extends Equatable {
  final String name;
  final int sets;
  final int reps;
  final int restTime; // in seconds
  final double? weight; // optional

  const Exercise({
    required this.name,
    required this.sets,
    required this.reps,
    required this.restTime,
    this.weight,
  });

  @override
  List<Object?> get props => [name, sets, reps, restTime, weight];
}
