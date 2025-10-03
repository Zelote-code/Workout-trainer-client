import 'package:equatable/equatable.dart';

enum UserRole { client, trainer, admin }

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final int? age;
  final String? gender;
  final String? fitnessGoal;
  final Map<String, dynamic>? bodyStats;
  final UserRole role;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.age,
    this.gender,
    this.fitnessGoal,
    this.bodyStats,
    required this.role,
  });

  @override
  List<Object?> get props => [id, name, email, age, gender, fitnessGoal, bodyStats, role];
}
