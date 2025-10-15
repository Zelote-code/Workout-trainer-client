// lib/domain/user/entities/user_entity.dart
import 'package:equatable/equatable.dart';

enum UserRole { client, trainer, admin }

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String? name;
  final int? age;
  final String? gender;
  final String? fitnessGoal;
  final double? weight;
  final double? height;
  final UserRole role;

  const UserEntity({
    required this.id,
    required this.email,
    this.name,
    this.age,
    this.gender,
    this.fitnessGoal,
    this.weight,
    this.height,
    this.role = UserRole.client,
  });

  @override
  List<Object?> get props => [id, email, name, age, gender, fitnessGoal, weight, height, role];
}
