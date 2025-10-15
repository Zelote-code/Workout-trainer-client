import 'package:dartz/dartz.dart';
import '../entities/performance_summary.dart';
import '../repositories/progress_repository.dart';
import '../../../core/error/failure.dart';
class CalculatePerformanceSummary {
  final ProgressRepository repository;

  CalculatePerformanceSummary(this.repository);

  Future<Either<Failure, PerformanceSummary>> call(String userId) async {
    return await repository.calculatePerformanceSummary(userId);
  }
}
