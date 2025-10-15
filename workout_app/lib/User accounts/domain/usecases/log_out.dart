// lib/domain/user/usecases/log_out.dart
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../repositories/user_repository.dart';

class LogOut {
  final UserRepository repository;

  LogOut(this.repository);

  Future<Either<Failure, void>> call() {
    return repository.logOut();
  }
}
