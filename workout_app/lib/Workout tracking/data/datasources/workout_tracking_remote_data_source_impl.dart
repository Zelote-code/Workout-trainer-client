import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/workout_session_model.dart';
import 'workout_tracking_remote_data_source.dart';

class WorkoutTrackingRemoteDataSourceImpl
    implements WorkoutTrackingRemoteDataSource {
  final FirebaseFirestore firestore;

  WorkoutTrackingRemoteDataSourceImpl(this.firestore);

  CollectionReference get _collection => firestore.collection('workout_sessions');

  @override
  Future<void> addWorkoutSession(WorkoutSessionModel session) async {
    await _collection.add(session.toMap());
  }

  @override
  Future<List<WorkoutSessionModel>> getWorkoutSessions(String userId) async {
    final snapshot = await _collection
        .where('userId', isEqualTo: userId)
        .orderBy('date', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => WorkoutSessionModel.fromMap(
            doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  @override
  Future<void> updateWorkoutSession(WorkoutSessionModel session) async {
    await _collection.doc(session.id).update(session.toMap());
  }

  @override
  Future<void> deleteWorkoutSession(String sessionId) async {
    await _collection.doc(sessionId).delete();
  }
}
