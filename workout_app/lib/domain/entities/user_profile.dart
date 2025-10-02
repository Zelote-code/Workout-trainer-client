import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final String id;
  final String name;
  final int age;
  final String gender;
  final String fitnessGoal;
  final double? weight;
  final double? height;
  final double? bodyFat;

  const UserProfile({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.fitnessGoal,
    this.weight,
    this.height,
    this.bodyFat,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    age,
    gender,
    fitnessGoal,
    weight,
    height,
    bodyFat,
  ];
}
