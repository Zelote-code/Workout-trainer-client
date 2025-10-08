import 'package:dartz/dartz.dart';
import '../repositories/progress_repository.dart';
import '../entities/failure.dart';

class ResetProgress {
  final ProgressRepository repository;

  ResetProgress(this.repository);

  Future<Either<Failure, Unit>> call(String userId) async {
    return await repository.resetProgress(userId);
  }
}
