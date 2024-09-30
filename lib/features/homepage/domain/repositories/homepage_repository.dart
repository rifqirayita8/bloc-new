import 'package:dartz/dartz.dart';
import 'package:my_practice_bloc/core/error/failure.dart';

abstract class HomepageRepository {
  Future<Either<Failure, String>> getProfile();
  Future<Either<Failure, String>> getResource();
}