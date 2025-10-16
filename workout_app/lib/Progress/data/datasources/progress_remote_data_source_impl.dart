import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/progress_record_model.dart';
import '../models/performance_summary_model.dart';
import 'progress_remote_data_source.dart';

class ProgressRemoteDataSourceImpl implements ProgressRemoteDataSource {
  final FirebaseFirestore firestore;

  ProgressRemoteDataSourceImpl(this.firestore);

  CollectionReference get _progressRecords =>
      firestore.collection('progress_records');

  CollectionReference get _performanceSummaries =>
      firestore.collection('performance_summaries');

  @override
  Future<List<ProgressRecordModel>> getProgressHistory(String userId) async {
    final querySnapshot = await _progressRecords
        .where('userId', isEqualTo: userId)
        .orderBy('date', descending: true)
        .get();

    return querySnapshot.docs
        .map((doc) =>
            ProgressRecordModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<PerformanceSummaryModel?> getPerformanceSummary(String userId) async {
    final doc = await _performanceSummaries.doc(userId).get();
    if (!doc.exists) return null;
    return PerformanceSummaryModel.fromMap(doc.data() as Map<String, dynamic>);
  }

  @override
  Future<void> updatePerformanceSummary(PerformanceSummaryModel summary) async {
    await _performanceSummaries.doc(summary.id).set(summary.toMap());
  }

  @override
  Future<void> addProgressRecord(ProgressRecordModel record) async {
    await _progressRecords.add(record.toMap());
  }

  @override
  Future<void> resetProgress(String userId) async {
    await _performanceSummaries.doc(userId).update({
      'totalWorkouts': 0,
      'totalWeightLifted': 0.0,
      'averageWeightPerWorkout': 0.0,
      'currentStreak': 0,
    });
  }
}
