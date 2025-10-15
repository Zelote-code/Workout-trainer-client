import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/workout_plan_model.dart';
import 'workout_plan_remote_data_source.dart';

class WorkoutPlanRemoteDataSourceImpl implements WorkoutPlanRemoteDataSource {
  final FirebaseFirestore firestore;

  WorkoutPlanRemoteDataSourceImpl(this.firestore);

  @override
  Future<void> createWorkoutPlan(WorkoutPlanModel plan) async {
    await firestore.collection('workout_plans').add(plan.toMap());
  }

  @override
  Future<List<WorkoutPlanModel>> getWorkoutPlans(String userId) async {
    final querySnapshot = await firestore
        .collection('workout_plans')
        .where('createdBy', isEqualTo: userId)
        .get();

    return querySnapshot.docs
        .map((doc) => WorkoutPlanModel.fromMap(doc.data(), doc.id))
        .toList();
  }

  @override
  Future<void> updateWorkoutPlan(WorkoutPlanModel plan) async {
    await firestore.collection('workout_plans').doc(plan.id).update(plan.toMap());
  }

  @override
  Future<void> deleteWorkoutPlan(String planId) async {
    await firestore.collection('workout_plans').doc(planId).delete();
  }
}
