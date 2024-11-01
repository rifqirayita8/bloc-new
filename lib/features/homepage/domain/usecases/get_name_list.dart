import 'package:dartz/dartz.dart';
import 'package:my_practice_bloc/core/error/failure.dart';
import 'package:my_practice_bloc/features/homepage/domain/repositories/homepage_repository.dart';

class GetNameList {
  final HomepageRepository repository;

  GetNameList(this.repository);

  Future<Either<Failure, List>> execute({required int page}) async {
    return await repository.getNameList(page: page);
  }
}