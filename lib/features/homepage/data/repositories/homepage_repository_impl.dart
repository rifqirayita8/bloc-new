import 'package:dartz/dartz.dart';
import 'package:my_practice_bloc/core/error/failure.dart';
import 'package:my_practice_bloc/features/homepage/data/datasources/homepage_remote_datasource.dart';
import 'package:my_practice_bloc/features/homepage/domain/entities/homepage_entities.dart';
import 'package:my_practice_bloc/features/homepage/domain/repositories/homepage_repository.dart';

class HomepageRepositoryImpl implements HomepageRepository{
  final HomepageRemoteDatasource remoteDatasource;

  HomepageRepositoryImpl(this.remoteDatasource);
  @override
  Future<Either<Failure, String>> getProfile() async {
    try {
      final response= await remoteDatasource.getProfile();
      return right(response);
    } catch(e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getResource() async {
    try {
      final response= await remoteDatasource.getResource();
      return right(response);
    } catch(e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HomepageData>>> getProfileList() async {
    try {
      final response= await remoteDatasource.getProfileList();
      return right(response);
    }catch(e) {
      return left(Failure(e.toString()));
    }
  }
  
}