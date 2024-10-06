import 'package:dartz/dartz.dart';
import 'package:my_practice_bloc/core/error/failure.dart';
import 'package:my_practice_bloc/features/homepage/domain/entities/resource.dart';
import 'package:my_practice_bloc/features/homepage/domain/repositories/homepage_repository.dart';

class GetResourceList {
  final HomepageRepository repository;

  GetResourceList(this.repository);

  Future<Either<Failure, List<Resource>>> execute() async {
    return await repository.getResourceList();
  }
}