import '../models/progress_record_model.dart';
import '../models/performance_summary_model.dart';

abstract class ProgressRemoteDataSource {
  Future<List<ProgressRecordModel>> getProgressHistory(String userId);
  Future<PerformanceSummaryModel?> getPerformanceSummary(String userId);
  Future<void> updatePerformanceSummary(PerformanceSummaryModel summary);
  Future<void> addProgressRecord(ProgressRecordModel record);
  Future<void> resetProgress(String userId);
}
