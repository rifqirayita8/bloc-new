import 'package:dartz/dartz.dart';
import 'package:my_practice_bloc/core/error/failure.dart';
import 'package:my_practice_bloc/features/profile/domain/entities/profile.dart';
import 'package:my_practice_bloc/features/profile/domain/usecases/profile_params.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> getUser(GetUserParams params);
}