import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    super.name,
    super.age,
    super.gender,
    super.fitnessGoal,
    super.weight,
    super.height,
    super.role,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      name: map['name'] as String?,
      age: map['age'] as int?,
      gender: map['gender'] as String?,
      fitnessGoal: map['fitnessGoal'] as String?,
      weight: (map['weight'] as num?)?.toDouble(),
      height: (map['height'] as num?)?.toDouble(),
      role: _roleFromString(map['role']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'age': age,
      'gender': gender,
      'fitnessGoal': fitnessGoal,
      'weight': weight,
      'height': height,
      'role': role.name,
    };
  }

  static UserRole _roleFromString(String? value) {
    switch (value) {
      case 'trainer':
        return UserRole.trainer;
      case 'admin':
        return UserRole.admin;
      default:
        return UserRole.client;
    }
  }

  factory UserModel.fromFirebaseUser(
    String uid,
    String email, [
    DocumentSnapshot<Map<String, dynamic>>? doc,
  ]) {
    final data = doc?.data();
    return UserModel(
      id: uid,
      email: email,
      name: data?['name'],
      age: data?['age'],
      gender: data?['gender'],
      fitnessGoal: data?['fitnessGoal'],
      weight: (data?['weight'] as num?)?.toDouble(),
      height: (data?['height'] as num?)?.toDouble(),
      role: _roleFromString(data?['role']),
    );
  }
}
