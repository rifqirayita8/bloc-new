import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/paint.dart';
import '../repositories/dashboard_repository.dart';
import 'dashboard_params.dart';

class GetPaint {
  final DashboardRepository dashboardRepository;

  GetPaint(this.dashboardRepository);

  Future<Either<Failure,Paint>>execute(DashboardParams params) async {
    return await dashboardRepository.getPaint(params);
  }
}