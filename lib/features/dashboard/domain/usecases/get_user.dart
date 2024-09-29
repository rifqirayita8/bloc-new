import 'package:dartz/dartz.dart';
import 'package:my_practice_bloc/core/error/failure.dart';
import 'package:my_practice_bloc/features/dashboard/domain/entities/profile.dart';
import 'package:my_practice_bloc/features/dashboard/domain/repositories/profile_repository.dart';
import 'package:my_practice_bloc/features/dashboard/domain/usecases/profile_params.dart';

class GetUser {
  final ProfileRepository profileRepository;

  GetUser(this.profileRepository);

  Future<Either<Failure,Profile>>execute(GetUserParams params) async {
    return await profileRepository.getUser(
      params,
    );
  }
}