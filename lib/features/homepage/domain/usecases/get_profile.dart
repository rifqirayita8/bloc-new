import 'package:dartz/dartz.dart';
import 'package:my_practice_bloc/core/error/failure.dart';
import 'package:my_practice_bloc/features/homepage/domain/repositories/homepage_repository.dart';

class GetProfile {
  final HomepageRepository repository;

  GetProfile(this.repository);

  Future<Either<Failure,String>> execute() async {
    return await repository.getProfile();
  }
}