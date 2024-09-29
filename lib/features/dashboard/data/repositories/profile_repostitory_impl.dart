import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../datasources/profile_remote_datasource.dart';
import '../../domain/entities/paint.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../../domain/usecases/dashboard_params.dart';

class ProfileRepositoryImpl  implements DashboardRepository {
  final ProfileRemoteDatasource profileRemoteDatasource;

  ProfileRepositoryImpl(this.profileRemoteDatasource);

  @override
  Future<Either<Failure, Profile>> getUser(DashboardParams params) async {
    try {
      final res= await profileRemoteDatasource.getUser(params);
      return right(res);
    } catch(e) {
      return left(Failure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, Paint>> getPaint(DashboardParams params) async {
    try {
      final res= await profileRemoteDatasource.getPaint(params);
      return right(res);
    } catch(e) {
      return left(Failure(e.toString()));
    }
  }

}