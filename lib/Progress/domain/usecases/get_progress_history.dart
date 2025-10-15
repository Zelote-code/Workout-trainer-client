import 'package:dartz/dartz.dart';
import '../entities/progress_record.dart';
import '../repositories/progress_repository.dart';
import '../../../core/error/failure.dart';

class GetProgressHistory {
  final ProgressRepository repository;

  GetProgressHistory(this.repository);

  Future<Either<Failure, List<ProgressRecord>>> call(String userId) async {
    return await repository.getProgressHistory(userId);
  }
}
