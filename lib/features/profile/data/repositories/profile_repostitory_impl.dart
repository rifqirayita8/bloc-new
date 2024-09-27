import 'package:dartz/dartz.dart';
import 'package:my_practice_bloc/core/error/failure.dart';
import 'package:my_practice_bloc/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:my_practice_bloc/features/profile/domain/entities/profile.dart';
import 'package:my_practice_bloc/features/profile/domain/repositories/profile_repository.dart';
import 'package:my_practice_bloc/features/profile/domain/usecases/profile_params.dart';

class ProfileRepositoryImpl  implements ProfileRepository {
  final ProfileRemoteDatasource profileRemoteDatasource;

  ProfileRepositoryImpl(this.profileRemoteDatasource);

  @override
  Future<Either<Failure, Profile>> getUser(GetUserParams params) async {
    try {
      final res= await profileRemoteDatasource.getUser(params);
      return right(res);
    } catch(e) {
      return left(Failure(e.toString()));
    }
  }
  
}