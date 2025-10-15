import 'package:dartz/dartz.dart';
import '../entities/progress_record.dart';
import '../entities/performance_summary.dart';
import '../../../core/error/failure.dart';

abstract class ProgressRepository {
  Future<Either<Failure, List<ProgressRecord>>> getProgressHistory(String userId);
  Future<Either<Failure, PerformanceSummary>> calculatePerformanceSummary(String userId);
  Future<Either<Failure, Unit>> resetProgress(String userId);
}
