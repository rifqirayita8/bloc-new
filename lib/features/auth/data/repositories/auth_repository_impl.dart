import 'package:dartz/dartz.dart';
import 'package:my_practice_bloc/core/error/exception.dart';
import 'package:my_practice_bloc/core/error/failure.dart';
import 'package:my_practice_bloc/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:my_practice_bloc/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepositoryImpl({required this.authRemoteDatasource});

  @override
  Future<Either<Failure, String>> authLogin(String email, String password) async {
    try {
      final response= await authRemoteDatasource.authLogin(email, password);
      return right(response);
    } on ServerException catch(e) {
      return left(Failure(e.message));
    } on GeneralException catch(e) {
      return left(Failure(e.message));
    }
  }
  
}