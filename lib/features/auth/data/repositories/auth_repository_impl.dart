import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  final AuthLocalDatasource authLocalDatasource;

  AuthRepositoryImpl(
    this.authRemoteDatasource,
    this.authLocalDatasource
  );

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
  
  @override
  Future<void> authSetUrl(String url) async {
    return await authLocalDatasource.authSetUrl(url);
  }
}