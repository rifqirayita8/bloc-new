import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/paint.dart';
import '../entities/profile.dart';
import '../usecases/dashboard_params.dart';

abstract class DashboardRepository {
  Future<Either<Failure, Profile>> getUser(DashboardParams params);
  Future<Either<Failure, Paint>> getPaint(DashboardParams params);
}