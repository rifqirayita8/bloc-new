import 'package:dartz/dartz.dart';
import 'package:my_practice_bloc/core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> authLogin(String email, String password);
}