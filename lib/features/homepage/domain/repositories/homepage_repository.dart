import 'package:dartz/dartz.dart';
import 'package:my_practice_bloc/core/error/failure.dart';
import 'package:my_practice_bloc/features/homepage/domain/entities/homepage_entities.dart';
import 'package:my_practice_bloc/features/homepage/domain/entities/resource.dart';

abstract class HomepageRepository {
  Future<Either<Failure, String>> getProfile();
  Future<Either<Failure, String>> getResource();
  Future<Either<Failure, List<HomepageData>>> getProfileList();
  Future<Either<Failure, List<Resource>>> getResourceList();
}