import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/profile.dart';
import '../repositories/dashboard_repository.dart';
import 'dashboard_params.dart';

class GetUser {
  final DashboardRepository profileRepository;

  GetUser(this.profileRepository);

  Future<Either<Failure,Profile>>execute(DashboardParams params) async {
    return await profileRepository.getUser(
      params,
    );
  }
}