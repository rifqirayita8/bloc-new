import 'package:dartz/dartz.dart';
import 'package:my_practice_bloc/core/error/failure.dart';
import 'package:my_practice_bloc/features/homepage/domain/entities/homepage_entities.dart';
import 'package:my_practice_bloc/features/homepage/domain/repositories/homepage_repository.dart';

class GetProfileList {
  final HomepageRepository repository;

  GetProfileList(this.repository);

  Future<Either<Failure, List<HomepageData>>> execute() async {
    return await repository.getProfileList();
  }
}